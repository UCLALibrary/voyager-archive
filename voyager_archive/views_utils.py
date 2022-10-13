from django.shortcuts import get_object_or_404
from pymarc import Record
from django.db.models import QuerySet
from .models import (
    AuthRecord,
    BibRecord,
    MfhdRecord,
    ItemView,
    PoHeaderView,
    PoLineItemView,
    VendorView,
    VendorAccountView,
)


def get_auth_record(auth_id: int) -> dict:
    marc_text = get_object_or_404(AuthRecord, auth_id=auth_id).auth_record
    return get_marc_fields(marc_text)


def get_bib_record(bib_id: int) -> dict:
    marc_text = get_object_or_404(BibRecord, bib_id=bib_id).bib_record
    return get_marc_fields(marc_text)


def get_mfhd_record(mfhd_id: int) -> dict:
    marc_text = get_object_or_404(MfhdRecord, mfhd_id=mfhd_id).mfhd_record
    return get_marc_fields(marc_text)


def get_marc_fields(marc_text: str) -> dict:
    byte_obj = marc_text.encode("utf-8")
    marc_record = Record(data=byte_obj)
    marc_fields = marc_record.get_fields()
    marc_field_list = []
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
    return marc_record_dict


def get_item(item_barcode: str) -> ItemView:
    item = get_object_or_404(ItemView, item_barcode=item_barcode)
    return item


def get_vendor(vendor_code: str) -> VendorView:
    vendor = get_object_or_404(VendorView, vendor_code=vendor_code)
    return vendor


def get_vendor_accts(vendor_id: int) -> QuerySet:
    vendor_accts = VendorAccountView.objects.filter(vendor_id=vendor_id)
    return vendor_accts


def get_po_header(po_number: str) -> PoHeaderView:
    purchase_order = get_object_or_404(PoHeaderView, po_number=po_number)
    return purchase_order


def get_po_lines(po_id: int) -> QuerySet:
    po_lines = PoLineItemView.objects.filter(po_id=po_id)
    return po_lines
