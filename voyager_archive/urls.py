from django.urls import path
from . import views

urlpatterns = [
    path("", views.search),
    path(
        "po_line_display/<int:po_line_item_id>",
        views.po_line_display,
        name="po_line_display",
    ),
]
