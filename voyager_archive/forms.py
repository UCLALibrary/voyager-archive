from django import forms

SEARCH_OPTIONS = [
    ('BIB_ID', 'Bib record id'),
    ('MFHD_ID', 'Holdings record id'),
    ('AUTH_ID', 'Authority record id'),
    ('ITEM_BARCODE', 'Item barcode'),
    ('PO_NUMBER', 'PO number'),
    ('INV_NUMBER', 'Invoice number'),
    ('VENDOR_CODE', 'Vendor code')
]


class VoyArchiveForm(forms.Form):
    search_type = forms.ChoiceField(choices=SEARCH_OPTIONS)
    search_term = forms.CharField(
        widget=forms.TextInput(
            attrs={
                'size': 30,
                'max_length': 25,
                'placeholder': 'Search term'
            }
        )
    )
