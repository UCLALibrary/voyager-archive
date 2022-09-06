from django.shortcuts import get_object_or_404
from .models import AuthRecord, BibRecord, MfhdRecord


def get_auth_record(auth_id: int) -> AuthRecord:
    return get_object_or_404(AuthRecord, auth_id=auth_id)


def get_bib_record(bib_id: int) -> BibRecord:
    return get_object_or_404(BibRecord, bib_id=bib_id)


def get_mfhd_record(mfhd_id: int) -> MfhdRecord:
    return get_object_or_404(MfhdRecord, mfhd_id=mfhd_id)
