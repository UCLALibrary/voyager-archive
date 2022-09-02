from http.client import INTERNAL_SERVER_ERROR
import logging
from django.shortcuts import render
from django.http.request import HttpRequest # for code completion
from django.http.response import HttpResponse
from .forms import VoyArchiveForm

logger = logging.getLogger(__name__)


def search(request: HttpRequest):
    if request.method == 'POST':
        form = VoyArchiveForm(request.POST)
        if form.is_valid():
            # Do stuff, using form.cleaned_data['search_type'] and form.cleaned_data['search_term']
            logger.info(f'Form data: {form.cleaned_data}')
            return render(request, 'voyager_archive/search.html', {'form': form})
    else:
        form = VoyArchiveForm()
        return render(request, 'voyager_archive/search.html', {'form': form})
