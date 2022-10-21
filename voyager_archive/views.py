from http.client import INTERNAL_SERVER_ERROR
import logging
from django.shortcuts import render
from django.http.request import HttpRequest  # for code completion
from django.http.response import HttpResponse
from .forms import VoyArchiveForm
from .views_utils import *


logger = logging.getLogger(__name__)


def search(request: HttpRequest) -> None:
    if request.method == "POST":
        form = VoyArchiveForm(request.POST)
        if form.is_valid():
            # Do stuff, using form.cleaned_data['search_type'] and form.cleaned_data['search_term']
            logger.info(f"Form data: {form.cleaned_data}")
            search_type = form.cleaned_data["search_type"]
            search_term = form.cleaned_data["search_term"]

            marc_record = None
            item = None
            po_header = None
            vendor = None
            if search_type == "AUTH_ID":
                marc_record = get_auth_record(search_term)
            elif search_type == "BIB_ID":
                marc_record = get_bib_record(search_term)
            elif search_type == "MFHD_ID":
                marc_record = get_mfhd_record(search_term)
            elif search_type == "ITEM_BARCODE":
                item = get_item(search_term)
            elif search_type == "PO_NUMBER":
                po_header = get_po_header(search_term)
                po_lines = get_po_lines(po_header.po_id)
            elif search_type == "VENDOR_CODE":
                vendor = get_vendor(search_term)
                vendor_accts = get_vendor_accts(vendor.vendor_id)

            if marc_record:
                context = {"form": form, "marc_record": marc_record}
                return render(request, "voyager_archive/marc_display.html", context)
            elif item:
                context = {"form": form, "item": item}
                return render(request, "voyager_archive/item_display.html", context)
            elif po_header:
                context = {"form": form, "po_header": po_header, "po_lines": po_lines}
                return render(request, "voyager_archive/po_display.html", context)
            elif vendor:
                context = {"form": form, "vendor": vendor, "vendor_accts": vendor_accts}
                return render(request, "voyager_archive/vendor_display.html", context)
    else:
        form = VoyArchiveForm()
        return render(request, "voyager_archive/search.html", {"form": form})


def po_line_display(request: HttpRequest, po_line_item_id: int) -> None:
    po_lines = get_po_lines_by_line_id(po_line_item_id)
    context = {"po_lines": po_lines}
    return render(request, "voyager_archive/po_line_display.html", context)
