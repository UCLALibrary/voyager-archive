from django.shortcuts import get_object_or_404
from pymarc import Record
from .models import AuthRecord, BibRecord, MfhdRecord


def get_auth_record(auth_id: int) -> AuthRecord:
    rec = AuthRecord.objects.get(auth_id=auth_id)
    marc_text = getattr(rec, "auth_record")
    
    byte_obj = marc_text.encode('utf-8')
    marc_record = Record(data=byte_obj)
    marc_fields = marc_record.get_fields()

    return marc_fields


def get_bib_record(bib_id: int) -> BibRecord:
    rec = BibRecord.objects.get(bib_id=bib_id)
    marc_text = getattr(rec, "bib_record")
    
    byte_obj = marc_text.encode('utf-8')
    marc_record = Record(data=byte_obj)
    marc_fields = marc_record.get_fields()

    return marc_fields


def get_mfhd_record(mfhd_id: int) -> MfhdRecord:
    rec = MfhdRecord.objects.get(mfhd_id=mfhd_id)
    marc_text = getattr(rec, "mfhd_record")
    
    byte_obj = marc_text.encode('utf-8')
    marc_record = Record(data=byte_obj)
    marc_fields = marc_record.get_fields()

    return marc_fields
