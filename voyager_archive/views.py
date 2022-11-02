import logging
from django.shortcuts import render, redirect
from django.http.request import HttpRequest  # for code completion
from django.http.response import HttpResponse
from .views_utils import *


logger = logging.getLogger(__name__)


def search(request: HttpRequest) -> None:
    if request.method == "POST":
        # Get form with search data from this request,
        # via utility function which also adds form
        # (with or without data) to all contexts for rendering.
        form = get_search_form(request)
        if form.is_valid():
            logger.info(f"Form data: {form.cleaned_data}")
            search_type = form.cleaned_data["search_type"]
            search_term = form.cleaned_data["search_term"]
            marc_record = None
            mfhd_summary = None
            item_summary = None
            if search_type == "AUTH_ID":
                marc_record = get_auth_record(search_term)
            elif search_type == "BIB_ID":
                marc_record = get_bib_record(search_term)
                mfhd_summary = get_mfhd_summary(search_term)
            elif search_type == "MFHD_ID":
                marc_record = get_mfhd_record(search_term)
                item_summary = get_item_summary(search_term)
            elif search_type == "INV_NUMBER":
                inv_headers = get_inv_headers(search_term)
                # If only 1, show directly; otherwise, show search results
                if len(inv_headers) == 1:
                    return redirect("invoice_display", inv_headers[0].invoice_id)
                else:
                    context = {"inv_headers": inv_headers}
                    return render(
                        request, "voyager_archive/invoice_results.html", context
                    )
            elif search_type == "ITEM_BARCODE":
                items = get_items(search_term)
                # If only 1, show directly; otherwise, show search results
                if len(items) == 1:
                    return redirect("item_display", items[0].item_id)
                else:
                    context = {"items": items}
                    return render(request, "voyager_archive/item_results.html", context)
            elif search_type == "PO_NUMBER":
                po_headers = get_po_headers(search_term)
                # If only 1, show directly; otherwise, show search results
                if len(po_headers) == 1:
                    return redirect("po_display", po_headers[0].po_id)
                else:
                    context = {"po_headers": po_headers}
                    return render(request, "voyager_archive/po_results.html", context)
            elif search_type == "VENDOR_CODE":
                vendors = get_vendors(search_term)
                # If only 1, show directly; otherwise, show search results
                if len(vendors) == 1:
                    return redirect("vendor_display", vendors[0].vendor_id)
                else:
                    context = {"vendors": vendors}
                    return render(
                        request, "voyager_archive/vendor_results.html", context
                    )

            if marc_record:
                context = {
                    "marc_record": marc_record,
                    "mfhd_summary": mfhd_summary,
                    "item_summary": item_summary,
                }
                return render(request, "voyager_archive/marc_display.html", context)
    else:
        # No POST, no search done, use blank form included in base context
        context = {}
        return render(request, "voyager_archive/search.html", context)


def po_line_display(request: HttpRequest, po_line_item_id: int) -> None:
    po_lines = get_po_lines_by_line_id(po_line_item_id)
    context = {"po_lines": po_lines}
    return render(request, "voyager_archive/po_line_display.html", context)


def po_display(request: HttpRequest, po_id: int) -> None:
    po_header = get_po_header_by_po_id(po_id)
    po_lines = get_po_lines(po_id)
    context = {"po_header": po_header, "po_lines": po_lines}
    return render(request, "voyager_archive/po_display.html", context)


def marc_display(request: HttpRequest, marc_type: str, record_id: int) -> None:
    mfhd_summary = None
    item_summary = None
    if marc_type == "bib":
        marc_record = get_bib_record(record_id)
        mfhd_summary = get_mfhd_summary(record_id)
    if marc_type == "mfhd":
        marc_record = get_mfhd_record(record_id)
        item_summary = get_item_summary(record_id)
    context = {
        "marc_record": marc_record,
        "mfhd_summary": mfhd_summary,
        "item_summary": item_summary,
    }
    return render(request, "voyager_archive/marc_display.html", context)


def invoice_display(request: HttpRequest, invoice_id: int) -> None:
    inv_header = get_inv_header_by_inv_id(invoice_id)
    inv_lines = get_inv_lines(invoice_id)
    inv_adjustments = get_inv_adjustments(invoice_id)
    context = {
        "inv_header": inv_header,
        "inv_lines": inv_lines,
        "inv_adjustments": inv_adjustments,
    }
    return render(request, "voyager_archive/invoice_display.html", context)


def inv_line_display(request: HttpRequest, inv_line_item_id: int) -> None:
    inv_lines = get_inv_lines_by_line_id(inv_line_item_id)
    context = {"inv_lines": inv_lines}
    return render(request, "voyager_archive/invoice_line_display.html", context)


def inv_adj_display(request: HttpRequest, payment_id: int) -> None:
    inv_adjustment = get_inv_adjustment(payment_id)
    context = {"inv_adjustment": inv_adjustment}
    return render(request, "voyager_archive/invoice_adjustment_display.html", context)


def item_display(request: HttpRequest, item_id: int) -> None:
    item = get_item_by_id(item_id)
    context = {"item": item}
    return render(request, "voyager_archive/item_display.html", context)


def vendor_display(request: HttpRequest, vendor_id: int) -> None:
    vendor = get_vendor_by_vendor_id(vendor_id)
    vendor_accts = get_vendor_accts(vendor_id)
    context = {"vendor": vendor, "vendor_accts": vendor_accts}
    return render(request, "voyager_archive/vendor_display.html", context)
