from django.shortcuts import get_object_or_404, get_list_or_404
from pymarc import Record
from .models import AuthRecord, BibRecord, MfhdRecord, ItemView, VendorView, VendorAccountView


def get_auth_record(auth_id: int) -> list:
    marc_text = get_object_or_404(AuthRecord, auth_id=auth_id).auth_record

    return get_marc_fields(marc_text)

def get_bib_record(bib_id: int) -> list:
    marc_text = get_object_or_404(BibRecord, bib_id=bib_id).bib_record

    return get_marc_fields(marc_text)

def get_mfhd_record(mfhd_id: int) -> list:
    marc_text = get_object_or_404(MfhdRecord, mfhd_id=mfhd_id).mfhd_record
   
    return get_marc_fields(marc_text)

def get_marc_fields(marc_text: str) -> list:
    byte_obj = marc_text.encode('utf-8')
    marc_record = Record(data=byte_obj)
    marc_fields = marc_record.get_fields()

    return marc_fields

def get_item(item_barcode: str) -> ItemView:
    item = get_object_or_404(ItemView, item_barcode=item_barcode)

    return item

def get_vendor(vendor_code: str) -> VendorView:
    vendor = get_object_or_404(VendorView, vendor_code=vendor_code)

    return vendor

def get_vendor_accts(vendor_id: int):
    vendor_accts = VendorAccountView.objects.filter(vendor_id=vendor_id)

    return vendor_accts