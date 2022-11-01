from django.shortcuts import get_object_or_404
from django.http.request import HttpRequest  # for code completion
from django.db.models import QuerySet
from pymarc import Record
from .forms import VoyArchiveForm
from .models import (
    AuthRecordView,
    BibRecordView,
    InvoiceAdjustmentView,
    InvoiceHeaderView,
    InvoiceLineView,
    MARCRecordView,
    MfhdRecordView,
    ItemView,
    MfhdSummaryView,
    PoHeaderView,
    PoLineItemView,
    VendorView,
    VendorAccountView,
)


def get_search_form(request: HttpRequest = None) -> VoyArchiveForm:
    # Convenience method to allow form to be
    # displayed on any page, whether search has
    # been done or not.
    if request and request.method == "POST":
        return VoyArchiveForm(request.POST)
    else:
        return VoyArchiveForm()


def get_auth_record(auth_id: int) -> AuthRecordView:
    model_record = get_object_or_404(AuthRecordView, marc_record_id=auth_id)
    return get_marc_fields(model_record)


def get_bib_record(bib_id: int) -> BibRecordView:
    model_record = get_object_or_404(BibRecordView, marc_record_id=bib_id)
    return get_marc_fields(model_record)


def get_mfhd_record(mfhd_id: int) -> MfhdRecordView:
    model_record = get_object_or_404(MfhdRecordView, marc_record_id=mfhd_id)
    return get_marc_fields(model_record)


def get_mfhd_summary(bib_id: int) -> QuerySet:
    mfhd_summary = MfhdSummaryView.objects.filter(bib_id=bib_id).order_by(
        "location_code", "mfhd_id"
    )
    return mfhd_summary


def get_marc_fields(model_record: type[MARCRecordView]) -> dict:
    # The model's MARC record, as a UTF-8 encoded string
    marc_text = model_record.marc_record
    # Get byte array from the MARC string, for pymarc
    byte_obj = marc_text.encode("utf-8")
    # Convert byte array to a pymarc Record object
    marc_record = Record(data=byte_obj)

    marc_fields = marc_record.get_fields()
    marc_field_list = []
    # This dict will be populated, then returned
    marc_record_dict = {}
    marc_record_dict["leader"] = marc_record.leader

    for field in marc_fields:
        tmp_rec_dict = {}
        tmp_rec_dict["tag"] = field.tag
        if hasattr(field, "data"):
            tmp_rec_dict["data"] = field.data

        if hasattr(field, "indicator1"):
            tmp_rec_dict["indicator1"] = field.indicator1.replace(" ", "_")
            tmp_rec_dict["indicator2"] = field.indicator2.replace(" ", "_")

        try:
            subfield_dict = {}
            subfield_default_dict = field.subfields_as_dict()
            for delim in subfield_default_dict.keys():
                subfield_dict[delim] = subfield_default_dict[delim]
            tmp_rec_dict["subfields"] = subfield_dict
        except Exception as e:
            # If subfields don't exist an exception is thrown
            pass

        marc_field_list.append(tmp_rec_dict)

    marc_record_dict["fields"] = marc_field_list
    marc_record_dict["suppressed"] = model_record.suppressed
    return marc_record_dict


def get_item_by_barcode(item_barcode: str) -> ItemView:
    item = get_object_or_404(ItemView, item_barcode=item_barcode)
    return item


def get_item_by_id(item_id: int) -> ItemView:
    item = ItemView.objects.get(item_id=item_id)
    return item


def get_item_summary(mfhd_id: int) -> QuerySet:
    item_summary = ItemView.objects.filter(mfhd_id=mfhd_id).order_by(
        "item_sequence_number"
    )
    return item_summary


def get_vendor(vendor_code: str) -> VendorView:
    vendor = get_object_or_404(VendorView, vendor_code=vendor_code)
    return vendor


def get_vendor_by_vendor_id(vendor_id: int) -> VendorView:
    vendor = VendorView.objects.get(vendor_id=vendor_id)
    return vendor


def get_vendor_accts(vendor_id: int) -> QuerySet:
    vendor_accts = VendorAccountView.objects.filter(vendor_id=vendor_id)
    return vendor_accts


def get_po_header(po_number: str) -> PoHeaderView:
    po_header = get_object_or_404(PoHeaderView, po_number=po_number)
    return po_header


def get_po_header_by_po_id(po_id: int) -> PoHeaderView:
    po_header = PoHeaderView.objects.get(po_id=po_id)
    return po_header


def get_po_lines(po_id: int) -> QuerySet:
    po_lines = PoLineItemView.objects.filter(po_id=po_id)
    return po_lines


def get_po_lines_by_line_id(line_item_id: int) -> QuerySet:
    po_lines = PoLineItemView.objects.filter(line_item_id=line_item_id).order_by(
        "split_fund_seq"
    )
    return po_lines


def get_inv_header(inv_number: str) -> InvoiceHeaderView:
    inv_header = get_object_or_404(InvoiceHeaderView, invoice_number=inv_number)
    return inv_header


def get_inv_lines(invoice_id: int) -> QuerySet:
    inv_lines = InvoiceLineView.objects.filter(invoice_id=invoice_id).order_by(
        "inv_line_item_id"
    )
    return inv_lines


def get_inv_lines_by_line_id(inv_line_item_id: int) -> QuerySet:
    inv_lines = InvoiceLineView.objects.filter(
        inv_line_item_id=inv_line_item_id
    ).order_by("split_fund_seq")
    return inv_lines


def get_inv_adjustments(invoice_id: int) -> QuerySet:
    # Gets all invoice adjustments for an invoice
    inv_adjustments = InvoiceAdjustmentView.objects.filter(
        invoice_id=invoice_id
    ).order_by("payment_id")
    return inv_adjustments


def get_inv_adjustment(payment_id: int) -> InvoiceAdjustmentView:
    # Gets one specific invoice adjustment
    inv_adjustment = InvoiceAdjustmentView.objects.get(payment_id=payment_id)
    return inv_adjustment
