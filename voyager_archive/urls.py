from django.urls import path
from . import views

urlpatterns = [
    path("", views.search),
    path(
        "search",
        views.search,
        name="search",
    ),
    path(
        "po_display/<int:po_id>",
        views.po_display,
        name="po_display",
    ),
    path(
        "po_line_display/<int:po_line_item_id>",
        views.po_line_display,
        name="po_line_display",
    ),
    path(
        "invoice_display/<int:invoice_id>",
        views.invoice_display,
        name="invoice_display",
    ),
    path(
        "inv_line_display/<int:inv_line_item_id>",
        views.inv_line_display,
        name="inv_line_display",
    ),
    path(
        "inv_adj_display/<int:payment_id>",
        views.inv_adj_display,
        name="inv_adj_display",
    ),
    path(
        "marc_display/<str:marc_type>/<int:record_id>",
        views.marc_display,
        name="marc_display",
    ),
    path(
        "item_display/<int:item_id>",
        views.item_display,
        name="item_display",
    ),
    path(
        "vendor_display/<int:vendor_id>",
        views.vendor_display,
        name="vendor_display",
    ),
    path(
        "help",
        views.help,
        name="help",
    ),
    path("release_notes/", views.release_notes, name="release_notes"),
]
