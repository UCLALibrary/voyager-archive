from django.test import TestCase
from voyager_archive.forms import VoyArchiveForm


class FormTests(TestCase):
    def test_valid_form_options(self):
        form_data = {'search_type': 'BIB_ID', 'search_term': 12345}
        form = VoyArchiveForm(data=form_data)
        self.assertTrue(form.is_valid())

    def test_invalid_search_type(self):
        form_data = {'search_type': 'BAD_TYPE', 'search_term': 12345}
        form = VoyArchiveForm(data=form_data)
        self.assertFormError(
            form=form,
            field='search_type',
            errors='Select a valid choice. BAD_TYPE is not one of the available choices.'
        )
