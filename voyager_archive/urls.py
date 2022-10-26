from django.urls import path
from . import views

urlpatterns = [
    path("", views.search),
    path(
        "po_line_display/<int:po_line_item_id>",
        views.po_line_display,
        name="po_line_display",
    ),
    path(
        "inv_line_display/<int:inv_line_item_id>",
        views.inv_line_display,
        name="inv_line_display",
    ),
    path(
        "marc_display/<str:marc_type>/<int:record_id>",
        views.marc_display,
        name="marc_display",
    ),
]
