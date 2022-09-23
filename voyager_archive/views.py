from http.client import INTERNAL_SERVER_ERROR
import logging
from django.shortcuts import render
from django.http.request import HttpRequest # for code completion
from django.http.response import HttpResponse
from .forms import VoyArchiveForm
from .views_utils import *


logger = logging.getLogger(__name__)


def search(request: HttpRequest) -> None:
    if request.method == 'POST':
        form = VoyArchiveForm(request.POST)
        if form.is_valid():
            # Do stuff, using form.cleaned_data['search_type'] and form.cleaned_data['search_term']
            logger.info(f'Form data: {form.cleaned_data}')
            search_type = form.cleaned_data['search_type']
            search_term = form.cleaned_data['search_term']
            if search_type == 'AUTH_ID':
                marc_record = get_auth_record(search_term)
            elif search_type == 'BIB_ID':
                marc_record = get_bib_record(search_term)
            elif search_type == 'MFHD_ID':
                marc_record = get_mfhd_record(search_term)

            context = {
                'form': form,
                'marc_record': marc_record
            }

            return render(request, 'voyager_archive/marc_display.html', context)
    else:
        form = VoyArchiveForm()
        return render(request, 'voyager_archive/search.html', {'form': form})
