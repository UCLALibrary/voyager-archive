from django.http.request import HttpRequest  # for code completion
from .forms import VoyArchiveForm
from .views_utils import get_search_form


def add_search_form_to_context(request: HttpRequest) -> dict:
    return {"search_form": get_search_form(request)}
