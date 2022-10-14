from django.db import models


class AccountLocation(models.Model):
    account_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    account_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "account_location"


class AccountNote(models.Model):
    account_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    vendor_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    note = models.CharField(max_length=1900, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "account_note"


class AddressType(models.Model):
    address_type = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    address_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "address_type"


class AdjustReason(models.Model):
    reason_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    reason_text = models.CharField(max_length=50, blank=True, null=True)
    charge_or_credit = models.CharField(max_length=1, blank=True, null=True)
    reason_edi_code = models.CharField(max_length=250, blank=True, null=True)
    vendor_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "adjust_reason"


class AuthRecord(models.Model):
    auth_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    auth_record = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "auth_record"


class BibMaster(models.Model):
    bib_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    library_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    suppress_in_opac = models.CharField(max_length=1, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    export_ok = models.CharField(max_length=1, blank=True, null=True)
    export_ok_date = models.DateTimeField(blank=True, null=True)
    export_ok_opid = models.CharField(max_length=10, blank=True, null=True)
    export_ok_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    export_date = models.DateTimeField(blank=True, null=True)
    exists_in_dps = models.CharField(max_length=1)
    exists_in_dps_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "bib_master"


class BibMfhd(models.Model):
    bib_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    mfhd_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "bib_mfhd"
        unique_together = (
            ("bib_id", "mfhd_id"),
            ("mfhd_id", "bib_id"),
        )


class BibRecord(models.Model):
    bib_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    bib_record = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "bib_record"


class CallSlip(models.Model):
    call_slip_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    print_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    bib_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    mfhd_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    date_requested = models.DateTimeField(blank=True, null=True)
    date_processed = models.DateTimeField(blank=True, null=True)
    location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    status = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    status_date = models.DateTimeField(blank=True, null=True)
    status_opid = models.CharField(max_length=10, blank=True, null=True)
    no_fill_reason = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_year = models.CharField(max_length=20, blank=True, null=True)
    item_enum = models.CharField(max_length=80, blank=True, null=True)
    item_chron = models.CharField(max_length=80, blank=True, null=True)
    note = models.CharField(max_length=100, blank=True, null=True)
    pickup_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    pickup_db_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_db_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    not_needed_after = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    reply_note = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "call_slip"


class CallSlipArchive(models.Model):
    archive_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    print_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    bib_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    mfhd_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    date_requested = models.DateTimeField(blank=True, null=True)
    date_processed = models.DateTimeField(blank=True, null=True)
    location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    status = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    status_date = models.DateTimeField(blank=True, null=True)
    status_opid = models.CharField(max_length=10, blank=True, null=True)
    no_fill_reason = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_year = models.CharField(max_length=20, blank=True, null=True)
    item_enum = models.CharField(max_length=80, blank=True, null=True)
    item_chron = models.CharField(max_length=80, blank=True, null=True)
    note = models.CharField(max_length=100, blank=True, null=True)
    pickup_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    pickup_db_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_db_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    not_needed_after = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    reply_note = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "call_slip_archive"


class CallSlipStatusType(models.Model):
    status_type = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    status_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "call_slip_status_type"


class CircTransArchive(models.Model):
    circ_transaction_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    circ_policy_matrix_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    charge_date = models.DateTimeField(blank=True, null=True)
    charge_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    charge_type = models.CharField(max_length=1, blank=True, null=True)
    charge_oper_id = models.CharField(max_length=10, blank=True, null=True)
    due_date = models.DateTimeField(blank=True, null=True)
    discharge_date = models.DateTimeField(blank=True, null=True)
    discharge_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    discharge_type = models.CharField(max_length=1, blank=True, null=True)
    discharge_oper_id = models.CharField(max_length=10, blank=True, null=True)
    renewal_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    recall_date = models.DateTimeField(blank=True, null=True)
    recall_due_date = models.DateTimeField(blank=True, null=True)
    recall_notice_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    recall_notice_date = models.DateTimeField(blank=True, null=True)
    overdue_notice_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overdue_notice_date = models.DateTimeField(blank=True, null=True)
    over_recall_notice_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    over_recall_notice_date = models.DateTimeField(blank=True, null=True)
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_id_proxy = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    courtesy_notice_date = models.DateTimeField(blank=True, null=True)
    db_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "circ_trans_archive"


class CircTransExceptType(models.Model):
    exception_type = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    exception_desc = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "circ_trans_except_type"


class CircTransException(models.Model):
    circ_trans_except_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    trans_except_date = models.DateTimeField(blank=True, null=True)
    trans_except_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    trans_except_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    trans_except_oper_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "circ_trans_exception"


class CircTransactions(models.Model):
    circ_transaction_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    circ_policy_matrix_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_id_proxy = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    charge_date = models.DateTimeField(blank=True, null=True)
    charge_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    charge_type = models.CharField(max_length=1, blank=True, null=True)
    charge_oper_id = models.CharField(max_length=10, blank=True, null=True)
    charge_due_date = models.DateTimeField(blank=True, null=True)
    discharge_date = models.DateTimeField(blank=True, null=True)
    discharge_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    discharge_type = models.CharField(max_length=1, blank=True, null=True)
    discharge_oper_id = models.CharField(max_length=10, blank=True, null=True)
    renewal_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    recall_date = models.DateTimeField(blank=True, null=True)
    recall_due_date = models.DateTimeField(blank=True, null=True)
    current_due_date = models.DateTimeField(blank=True, null=True)
    recall_notice_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    recall_notice_date = models.DateTimeField(blank=True, null=True)
    overdue_notice_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overdue_notice_date = models.DateTimeField(blank=True, null=True)
    over_recall_notice_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    over_recall_notice_date = models.DateTimeField(blank=True, null=True)
    courtesy_notice_date = models.DateTimeField(blank=True, null=True)
    db_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "circ_transactions"


class ClaimTypes(models.Model):
    claim_type = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    edi_code = models.CharField(max_length=11, blank=True, null=True)
    claim_type_desc = models.CharField(max_length=70, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "claim_types"


class CurrencyConversion(models.Model):
    currency_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    country_name = models.CharField(max_length=75, blank=True, null=True)
    normal_country_name = models.CharField(max_length=75, blank=True, null=True)
    currency_name = models.CharField(max_length=75, blank=True, null=True)
    normal_currency_name = models.CharField(max_length=75, blank=True, null=True)
    currency_code = models.CharField(max_length=3, blank=True, null=True)
    normal_currency_code = models.CharField(max_length=3, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    create_operator_id = models.CharField(max_length=10, blank=True, null=True)
    conversion_rate = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    rate_create_date_time = models.DateTimeField(blank=True, null=True)
    rate_create_operator_id = models.CharField(max_length=10, blank=True, null=True)
    decimals = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    decimal_delimiter = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "currency_conversion"


class FineFee(models.Model):
    fine_fee_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    create_date = models.DateTimeField(blank=True, null=True)
    operator_id = models.CharField(max_length=10, blank=True, null=True)
    fine_fee_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fine_fee_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fine_fee_amount = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fine_fee_balance = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fine_fee_note = models.CharField(max_length=1000, blank=True, null=True)
    orig_charge_date = models.DateTimeField(blank=True, null=True)
    due_date = models.DateTimeField(blank=True, null=True)
    fine_fee_notice_date = models.DateTimeField(blank=True, null=True)
    db_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    discharge_date = models.DateTimeField(blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_oper_id = models.CharField(max_length=10, blank=True, null=True)
    modify_loc_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "fine_fee"


class FineFeeTransMethod(models.Model):
    method_type = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    method_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "fine_fee_trans_method"


class FineFeeTransType(models.Model):
    transaction_type = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    transaction_desc = models.CharField(max_length=25, blank=True, null=True)
    type_fine = models.CharField(max_length=1, blank=True, null=True)
    type_demerit = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "fine_fee_trans_type"


class FineFeeTransactions(models.Model):
    fine_fee_trans_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    fine_fee_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    trans_date = models.DateTimeField(blank=True, null=True)
    trans_amount = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    trans_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    trans_method = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    trans_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    operator_id = models.CharField(max_length=10, blank=True, null=True)
    trans_note = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "fine_fee_transactions"


class FineFeeType(models.Model):
    fine_fee_type = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    fine_fee_desc = models.CharField(max_length=25, blank=True, null=True)
    fine_fee_code = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "fine_fee_type"


class FiscalPeriod(models.Model):
    fiscal_period_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    fiscal_period_name = models.CharField(max_length=25, blank=True, null=True)
    start_date = models.DateTimeField(blank=True, null=True)
    end_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "fiscal_period"


class Fund(models.Model):
    fund_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ledger_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    parent_fund = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fund_name = models.CharField(max_length=25, blank=True, null=True)
    normal_fund_name = models.CharField(max_length=25, blank=True, null=True)
    fund_code = models.CharField(max_length=10, blank=True, null=True)
    normal_fund_code = models.CharField(max_length=10, blank=True, null=True)
    category = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fund_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    begin_date = models.DateTimeField(blank=True, null=True)
    end_date = models.DateTimeField(blank=True, null=True)
    institution_fund_id = models.CharField(max_length=50, blank=True, null=True)
    expend_only = models.CharField(max_length=1, blank=True, null=True)
    original_allocation = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    allocation_increase = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    allocation_decrease = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    commit_pending = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    commitments = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expend_pending = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expenditures = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overcommit = models.CharField(max_length=1, blank=True, null=True)
    overcommit_warn = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overcommit_percent = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    commit_freeze = models.DateTimeField(blank=True, null=True)
    undercommit_percent = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overexpend = models.CharField(max_length=1, blank=True, null=True)
    overexpend_warn = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overexpend_percent = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expend_freeze = models.DateTimeField(blank=True, null=True)
    underexpend_percent = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    update_opid = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "fund"
        unique_together = (("ledger_id", "fund_id"),)


class FundNote(models.Model):
    fund_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ledger_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fund_note = models.CharField(max_length=1900, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "fund_note"
        unique_together = (("fund_id", "ledger_id"),)


class FundPayment(models.Model):
    payment_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    split_fund_seq = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ledger_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fund_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    percentage = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    amount = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "fund_payment"


class FundTransaction(models.Model):
    fund_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    audit_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    ledger_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    trans_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    amount = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    trans_date = models.DateTimeField(blank=True, null=True)
    operator_id = models.CharField(max_length=10, blank=True, null=True)
    reference_no = models.CharField(max_length=25, blank=True, null=True)
    statistical_fund = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    note = models.CharField(max_length=1900, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "fund_transaction"


class FundType(models.Model):
    fund_type_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    fund_type_name = models.CharField(max_length=25, blank=True, null=True)
    commit_warning = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expend_warning = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overcommit_limit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overexpend_limit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    undercommit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    underexpend = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "fund_type"


class HoldRecall(models.Model):
    hold_recall_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    hold_recall_type = models.CharField(max_length=1, blank=True, null=True)
    pickup_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expire_date = models.DateTimeField(blank=True, null=True)
    available_notice_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    available_notice_date = models.DateTimeField(blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    create_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    bib_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    request_level = models.CharField(max_length=1, blank=True, null=True)
    request_item_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    request_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_comment = models.CharField(max_length=100, blank=True, null=True)
    patron_group_id = models.BigIntegerField(blank=True, null=True)
    call_slip_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    holding_db_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    modify_opid = models.CharField(max_length=10, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "hold_recall"


class HoldRecallArchive(models.Model):
    hold_recall_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    hold_recall_type = models.CharField(max_length=1, blank=True, null=True)
    pickup_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expire_date = models.DateTimeField(blank=True, null=True)
    available_notice_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    available_notice_date = models.DateTimeField(blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    create_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    bib_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    request_level = models.CharField(max_length=1, blank=True, null=True)
    request_item_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    request_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_comment = models.CharField(max_length=100, blank=True, null=True)
    patron_id = models.BigIntegerField(blank=True, null=True)
    patron_group_id = models.BigIntegerField(blank=True, null=True)
    call_slip_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    holding_db_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    modify_opid = models.CharField(max_length=10, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "hold_recall_archive"


class HoldRecallItemArchive(models.Model):
    hold_recall_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    hold_recall_type = models.CharField(max_length=1, blank=True, null=True)
    hold_recall_status = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    hold_recall_status_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "hold_recall_item_archive"


class HoldRecallItems(models.Model):
    hold_recall_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    queue_position = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    hold_recall_type = models.CharField(max_length=1, blank=True, null=True)
    hold_recall_status = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    hold_recall_status_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "hold_recall_items"


class HoldRecallStatus(models.Model):
    hr_status_type = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    hr_status_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "hold_recall_status"


class InvLineItemNotes(models.Model):
    inv_line_item_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    invoice_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    note = models.CharField(max_length=1900, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "inv_line_item_notes"


class Invoice(models.Model):
    invoice_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    vendor_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    account_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    invoice_number = models.CharField(max_length=25, blank=True, null=True)
    normal_invoice_number = models.CharField(max_length=25, blank=True, null=True)
    invoice_status = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    invoice_status_date = models.DateTimeField(blank=True, null=True)
    invoice_date = models.DateTimeField(blank=True, null=True)
    voucher_number = models.CharField(max_length=25, blank=True, null=True)
    currency_code = models.CharField(max_length=3, blank=True, null=True)
    conversion_rate = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    invoice_total = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    bill_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    invoice_quantity = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    line_item_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    line_item_subtotal = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    adjustments_subtotal = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    total = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    invoice_create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    create_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    invoice_update_date = models.DateTimeField(blank=True, null=True)
    update_opid = models.CharField(max_length=10, blank=True, null=True)
    update_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    edi_ref = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expend_date = models.DateTimeField(blank=True, null=True)
    check_number = models.CharField(max_length=40, blank=True, null=True)
    normal_check_number = models.CharField(max_length=40, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "invoice"


class InvoiceFunds(models.Model):
    invoice_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ledger_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fund_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    commit_pending = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    commitments = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expend_pending = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expenditures = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "invoice_funds"
        unique_together = (("invoice_id", "ledger_id", "fund_id"),)


class InvoiceLineItem(models.Model):
    inv_line_item_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    invoice_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    line_item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    unit_price = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    line_price = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    quantity = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    prepay_amount = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    piece_identifier = models.CharField(max_length=500, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    update_opid = models.CharField(max_length=10, blank=True, null=True)
    edi_ref = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "invoice_line_item"


class InvoiceLineItemFunds(models.Model):
    copy_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    inv_line_item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    split_fund_seq = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ledger_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fund_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    percentage = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    amount = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    allocation_method = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "invoice_line_item_funds"
        unique_together = (("copy_id", "split_fund_seq", "inv_line_item_id"),)


class InvoiceNote(models.Model):
    invoice_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    note = models.CharField(max_length=1900, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "invoice_note"


class InvoiceStatus(models.Model):
    invoice_status = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    invoice_status_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "invoice_status"


class Item(models.Model):
    item_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    perm_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    temp_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_type_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    temp_item_type_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    copy_number = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    on_reserve = models.CharField(max_length=1, blank=True, null=True)
    reserve_charges = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    pieces = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    price = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    spine_label = models.CharField(max_length=25, blank=True, null=True)
    historical_charges = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    historical_browses = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    recalls_placed = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    holds_placed = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    create_date = models.DateTimeField(blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    create_operator_id = models.CharField(max_length=10, blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)
    create_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    modify_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_sequence_number = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    historical_bookings = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    media_type_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    short_loan_charges = models.BigIntegerField(blank=True, null=True)
    magnetic_media = models.CharField(max_length=1, blank=True, null=True)
    sensitize = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "item"


class ItemBarcode(models.Model):
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_barcode = models.CharField(max_length=30, blank=True, null=True)
    barcode_status = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    barcode_status_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "item_barcode"


class ItemBarcodeStatus(models.Model):
    barcode_status_type = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    barcode_status_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "item_barcode_status"


class ItemNote(models.Model):
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_note = models.CharField(max_length=1000, blank=True, null=True)
    item_note_type = models.BigIntegerField()
    last_modified = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "item_note"


class ItemNoteType(models.Model):
    note_type = models.BigIntegerField(primary_key=True)
    note_desc = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "item_note_type"


class ItemStatCode(models.Model):
    item_stat_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    item_stat_code = models.CharField(max_length=3, blank=True, null=True)
    item_stat_code_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "item_stat_code"


class ItemStats(models.Model):
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_stat_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    date_applied = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "item_stats"


class ItemStatus(models.Model):
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_status = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_status_date = models.DateTimeField(blank=True, null=True)
    item_status_operator = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "item_status"


class ItemStatusType(models.Model):
    item_status_type = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    item_status_desc = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = "item_status_type"


class ItemType(models.Model):
    item_type_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    item_type_code = models.CharField(max_length=10, blank=True, null=True)
    item_type_name = models.CharField(max_length=25, blank=True, null=True)
    item_type_display = models.CharField(max_length=40, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "item_type"


class Ledger(models.Model):
    ledger_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    fiscal_year_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    acq_policy_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ledger_name = models.CharField(max_length=40, blank=True, null=True)
    normal_ledger_name = models.CharField(max_length=40, blank=True, null=True)
    overcommit = models.CharField(max_length=1, blank=True, null=True)
    overcommit_warn = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overcommit_percent = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    commit_freeze = models.DateTimeField(blank=True, null=True)
    undercommit_percent = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overexpend = models.CharField(max_length=1, blank=True, null=True)
    overexpend_warn = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overexpend_percent = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expend_freeze = models.DateTimeField(blank=True, null=True)
    underexpend_percent = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    update_opid = models.CharField(max_length=10, blank=True, null=True)
    rule_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    new_ledger_name = models.CharField(max_length=40, blank=True, null=True)
    normal_new_ledger_name = models.CharField(max_length=40, blank=True, null=True)
    new_ledger_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "ledger"


class LedgerNote(models.Model):
    ledger_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    note = models.CharField(max_length=1900, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "ledger_note"


class LineItem(models.Model):
    line_item_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    po_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    bib_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    line_item_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    line_item_number = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    piece_identifier = models.CharField(max_length=50, blank=True, null=True)
    unit_price = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    line_price = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    print_std_num = models.CharField(max_length=2, blank=True, null=True)
    quantity = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    prepay_amount = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    rush = models.CharField(max_length=1, blank=True, null=True)
    claim_interval = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    cancel_interval = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    donor = models.CharField(max_length=50, blank=True, null=True)
    requestor = models.CharField(max_length=50, blank=True, null=True)
    vendor_title_num = models.CharField(max_length=25, blank=True, null=True)
    vendor_ref_qual = models.CharField(max_length=3, blank=True, null=True)
    vendor_ref_num = models.CharField(max_length=35, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    update_opid = models.CharField(max_length=10, blank=True, null=True)
    edi_ref = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    standard_num = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "line_item"


class LineItemCopy(models.Model):
    line_item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ship_to_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    copy_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    use_ledger = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    use_fund = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "line_item_copy"
        unique_together = (("line_item_id", "location_id"),)


class LineItemCopyStatus(models.Model):
    line_item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    copy_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    mfhd_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    line_item_status = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    invoice_item_status = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    status_date = models.DateTimeField(blank=True, null=True)
    receive_operator = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "line_item_copy_status"


class LineItemFunds(models.Model):
    copy_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    split_fund_seq = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ledger_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fund_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    percentage = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    prepay_percentage = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    amount = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    prepay = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    allocation_method = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "line_item_funds"
        unique_together = (("copy_id", "split_fund_seq"),)


class LineItemNotes(models.Model):
    line_item_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    po_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    print_note = models.CharField(max_length=60, blank=True, null=True)
    note = models.CharField(max_length=1900, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "line_item_notes"


class LineItemStatus(models.Model):
    line_item_status = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    line_item_status_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "line_item_status"


class LineItemType(models.Model):
    line_item_type = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    line_item_type_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "line_item_type"


class Location(models.Model):
    location_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    location_code = models.CharField(max_length=10, blank=True, null=True)
    location_name = models.CharField(max_length=25, blank=True, null=True)
    location_display_name = models.CharField(max_length=60, blank=True, null=True)
    location_spine_label = models.CharField(max_length=25, blank=True, null=True)
    location_opac = models.CharField(max_length=1, blank=True, null=True)
    suppress_in_opac = models.CharField(max_length=1, blank=True, null=True)
    library_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    mfhd_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "location"


class MfhdItem(models.Model):
    mfhd_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    item_enum = models.CharField(max_length=80, blank=True, null=True)
    chron = models.CharField(max_length=80, blank=True, null=True)
    year = models.CharField(max_length=20, blank=True, null=True)
    caption = models.CharField(max_length=256, blank=True, null=True)
    freetext = models.CharField(max_length=256, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "mfhd_item"
        unique_together = (
            ("item_id", "mfhd_id"),
            ("mfhd_id", "item_id"),
        )


class MfhdMaster(models.Model):
    mfhd_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    call_no_type = models.CharField(max_length=1, blank=True, null=True)
    normalized_call_no = models.CharField(max_length=300, blank=True, null=True)
    display_call_no = models.CharField(max_length=300, blank=True, null=True)
    suppress_in_opac = models.CharField(max_length=1, blank=True, null=True)
    source_module = models.CharField(max_length=1, blank=True, null=True)
    record_status = models.CharField(max_length=1, blank=True, null=True)
    record_type = models.CharField(max_length=1, blank=True, null=True)
    encoding_level = models.CharField(max_length=1, blank=True, null=True)
    field_007 = models.CharField(max_length=23, blank=True, null=True)
    field_008 = models.CharField(max_length=32, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    export_ok = models.CharField(max_length=1, blank=True, null=True)
    export_ok_date = models.DateTimeField(blank=True, null=True)
    export_ok_opid = models.CharField(max_length=10, blank=True, null=True)
    export_ok_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    export_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "mfhd_master"


class MfhdRecord(models.Model):
    mfhd_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    mfhd_record = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "mfhd_record"


class NoFillReason(models.Model):
    reason_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    reason_code = models.CharField(max_length=10, blank=True, null=True)
    reason_desc = models.CharField(max_length=50, blank=True, null=True)
    suppress = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "no_fill_reason"


class NoteType(models.Model):
    note_type = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    note_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "note_type"


class Operator(models.Model):
    operator_id = models.CharField(primary_key=True, max_length=10)
    first_name = models.CharField(max_length=25, blank=True, null=True)
    middle_initial = models.CharField(max_length=1, blank=True, null=True)
    last_name = models.CharField(max_length=25, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_opid = models.CharField(max_length=10, blank=True, null=True)
    never_expire = models.CharField(max_length=1)
    manual_expire = models.CharField(max_length=1)
    invalid_login_time = models.DateTimeField(blank=True, null=True)
    lockout_time = models.DateTimeField(blank=True, null=True)
    lockout_counter = models.DecimalField(
        max_digits=22, decimal_places=0, blank=True, null=True
    )
    restrict_password_change = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = "operator"


class OrderTypes(models.Model):
    order_type = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    order_type_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "order_types"


class Patron(models.Model):
    patron_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    name_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    last_name = models.CharField(max_length=50, blank=True, null=True)
    normal_last_name = models.CharField(max_length=50, blank=True, null=True)
    first_name = models.CharField(max_length=50, blank=True, null=True)
    normal_first_name = models.CharField(max_length=50, blank=True, null=True)
    middle_name = models.CharField(max_length=50, blank=True, null=True)
    normal_middle_name = models.CharField(max_length=50, blank=True, null=True)
    title = models.CharField(max_length=20, blank=True, null=True)
    ssan = models.CharField(max_length=11, blank=True, null=True)
    institution_id = models.CharField(max_length=30, blank=True, null=True)
    normal_institution_id = models.CharField(max_length=30, blank=True, null=True)
    registration_date = models.DateTimeField(blank=True, null=True)
    create_operator_id = models.CharField(max_length=10, blank=True, null=True)
    home_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    create_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)
    modify_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    modify_date = models.DateTimeField(blank=True, null=True)
    expire_date = models.DateTimeField(blank=True, null=True)
    purge_date = models.DateTimeField(blank=True, null=True)
    current_charges = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    total_fees_due = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    note_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    current_hold_shelf = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    recalls_placed = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    holds_placed = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    items_recalled = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    historical_charges = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    claims_return = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    lost_items = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    self_shelved = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    counter_reset_date = models.DateTimeField(blank=True, null=True)
    counter_reset_oper_id = models.CharField(max_length=10, blank=True, null=True)
    current_bookings = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    late_media_returns = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    historical_bookings = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    cancelled_bookings = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    unclaimed_bookings = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    media_counter_reset_date = models.DateTimeField(blank=True, null=True)
    media_counter_reset_opid = models.CharField(max_length=10, blank=True, null=True)
    current_call_slips = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    historical_call_slips = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    historical_distributions = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    current_short_loans = models.BigIntegerField(blank=True, null=True)
    historical_short_loans = models.BigIntegerField(blank=True, null=True)
    unclaimed_short_loans = models.BigIntegerField(blank=True, null=True)
    db_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    patron_id_ub = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    current_charges_ub = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    historical_charges_ub = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    requests_ub = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    historical_requests_ub = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    claims_return_ub = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    lost_items_ub = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    total_fees_due_ub = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    self_shelved_ub = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_pin = models.CharField(max_length=12, blank=True, null=True)
    suspension_date = models.DateTimeField(blank=True, null=True)
    total_demerits = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    total_demerits_due_ub = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    sms_number = models.CharField(max_length=50, blank=True, null=True)
    birth_date = models.DateTimeField(blank=True, null=True)
    major = models.CharField(max_length=50, blank=True, null=True)
    department = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron"


class PatronAddress(models.Model):
    address_id = models.DecimalField(
        unique=True, max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    address_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    address_status = models.CharField(max_length=1, blank=True, null=True)
    protect_address = models.CharField(max_length=1, blank=True, null=True)
    address_line1 = models.CharField(max_length=100, blank=True, null=True)
    address_line2 = models.CharField(max_length=100, blank=True, null=True)
    address_line3 = models.CharField(max_length=100, blank=True, null=True)
    address_line4 = models.CharField(max_length=100, blank=True, null=True)
    address_line5 = models.CharField(max_length=100, blank=True, null=True)
    city = models.CharField(max_length=40, blank=True, null=True)
    state_province = models.CharField(max_length=7, blank=True, null=True)
    zip_postal = models.CharField(max_length=10, blank=True, null=True)
    country = models.CharField(max_length=20, blank=True, null=True)
    effect_date = models.DateTimeField(blank=True, null=True)
    expire_date = models.DateTimeField(blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron_address"


class PatronBarcode(models.Model):
    patron_barcode_id = models.DecimalField(
        unique=True, max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_barcode = models.CharField(max_length=25, blank=True, null=True)
    barcode_status = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    barcode_status_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)
    home_barcode_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    home_patron_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "patron_barcode"


class PatronBarcodeStatus(models.Model):
    barcode_status_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    barcode_status_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron_barcode_status"


class PatronGroup(models.Model):
    patron_group_id = models.DecimalField(
        unique=True, max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_group_code = models.CharField(max_length=10, blank=True, null=True)
    patron_group_name = models.CharField(max_length=25, blank=True, null=True)
    patron_group_display = models.CharField(max_length=40, blank=True, null=True)
    demerits_applies = models.CharField(max_length=1, blank=True, null=True)
    max_demerits = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    suspension_days = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    circ_cluster_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    charged_status_display = models.CharField(max_length=1, blank=True, null=True)
    charge_limit = models.BigIntegerField(blank=True, null=True)
    charge_limit_apply = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron_group"


class PatronGroupItemType(models.Model):
    patron_group_id = models.BigIntegerField(blank=True, null=True)
    item_type_id = models.BigIntegerField(blank=True, null=True)
    charge_limit = models.BigIntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron_group_item_type"


class PatronGroupPolicy(models.Model):
    circ_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_group_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fees_applies = models.CharField(max_length=1, blank=True, null=True)
    max_outstanding_balance = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    overdue_notice_applies = models.CharField(max_length=1, blank=True, null=True)
    min_balance_for_notice = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    max_item_limit = models.CharField(max_length=1, blank=True, null=True)
    item_limit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    max_overdue_limit = models.CharField(max_length=1, blank=True, null=True)
    overdue_limit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    max_overdue_recall_limit = models.CharField(max_length=1, blank=True, null=True)
    overdue_recall_limit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    max_recall_limit = models.CharField(max_length=1, blank=True, null=True)
    recall_limit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    max_self_shelve_limit = models.CharField(max_length=1, blank=True, null=True)
    self_shelve_limit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    max_claim_return_limit = models.CharField(max_length=1, blank=True, null=True)
    claim_return_limit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    max_lost_limit = models.CharField(max_length=1, blank=True, null=True)
    lost_limit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    place_hold_outside_lib = models.CharField(max_length=1, blank=True, null=True)
    place_hold_inside_lib = models.CharField(max_length=1, blank=True, null=True)
    place_recall_outside_lib = models.CharField(max_length=1, blank=True, null=True)
    place_recall_inside_lib = models.CharField(max_length=1, blank=True, null=True)
    place_interlib_loan_req = models.CharField(max_length=1, blank=True, null=True)
    place_purchase_req = models.CharField(max_length=1, blank=True, null=True)
    courtesy_notice_applies = models.CharField(max_length=1, blank=True, null=True)
    call_slip_limit = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    max_call_slips = models.CharField(max_length=1, blank=True, null=True)
    place_call_slips = models.CharField(max_length=1, blank=True, null=True)
    email_courtesy_notice = models.CharField(max_length=1, blank=True, null=True)
    email_cancellation_notice = models.CharField(max_length=1, blank=True, null=True)
    email_item_available_notice = models.CharField(max_length=1, blank=True, null=True)
    email_overdue_notice = models.CharField(max_length=1, blank=True, null=True)
    email_overdue_notice_other = models.CharField(max_length=1, blank=True, null=True)
    email_overdue_recall_notice = models.CharField(max_length=1, blank=True, null=True)
    email_recall_notice = models.CharField(max_length=1, blank=True, null=True)
    place_short_loan_in_lib = models.CharField(max_length=1, blank=True, null=True)
    max_total_short_loan = models.CharField(max_length=1, blank=True, null=True)
    total_short_loan = models.BigIntegerField(blank=True, null=True)
    max_title_short_loan = models.CharField(max_length=1, blank=True, null=True)
    title_short_loan = models.BigIntegerField(blank=True, null=True)
    max_day_short_loan = models.CharField(max_length=1, blank=True, null=True)
    day_short_loan = models.BigIntegerField(blank=True, null=True)
    hold_request_limit = models.BigIntegerField(blank=True, null=True)
    max_hold_request = models.CharField(max_length=1, blank=True, null=True)
    include_hold_in_borrow_limit = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron_group_policy"


class PatronNameType(models.Model):
    patron_name_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_name_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron_name_type"


class PatronNotes(models.Model):
    patron_note_id = models.DecimalField(
        unique=True, max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    note_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    address_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    note = models.CharField(max_length=1900, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron_notes"


class PatronPhone(models.Model):
    patron_phone_id = models.DecimalField(
        unique=True, max_digits=38, decimal_places=0, blank=True, null=True
    )
    address_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    phone_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    phone_number = models.CharField(max_length=25, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron_phone"


class PatronStatCode(models.Model):
    patron_stat_id = models.DecimalField(
        unique=True, max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_stat_code = models.CharField(
        unique=True, max_length=3, blank=True, null=True
    )
    patron_stat_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron_stat_code"


class PatronStats(models.Model):
    patron_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_stat_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    date_applied = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "patron_stats"


class PhoneType(models.Model):
    phone_type = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    phone_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "phone_type"


class PoFunds(models.Model):
    po_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    ledger_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    fund_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    commit_pending = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    commitments = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expend_pending = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expenditures = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "po_funds"
        unique_together = (("po_id", "ledger_id", "fund_id"),)


class PoNotes(models.Model):
    po_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    print_note = models.CharField(max_length=60, blank=True, null=True)
    note = models.CharField(max_length=1900, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "po_notes"


class PoStatus(models.Model):
    po_status = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    po_status_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "po_status"


class PoType(models.Model):
    po_type = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    po_type_desc = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "po_type"


class PriceAdjustment(models.Model):
    object_type = models.CharField(max_length=1, blank=True, null=True)
    object_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    sequence = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    reason_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    method = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    adjust_amount = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    payment_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "price_adjustment"
        unique_together = (("object_type", "object_id", "sequence"),)


class ProxyPatron(models.Model):
    patron_barcode_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    patron_barcode_id_proxy = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    create_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    expiration_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "proxy_patron"


class PurchaseOrder(models.Model):
    po_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    vendor_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    account_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    po_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    po_number = models.CharField(max_length=25, blank=True, null=True)
    normal_po_number = models.CharField(max_length=25, blank=True, null=True)
    order_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ship_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    bill_location = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    currency_code = models.CharField(max_length=3, blank=True, null=True)
    conversion_rate = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    po_status = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    po_status_date = models.DateTimeField(blank=True, null=True)
    po_create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    po_update_date = models.DateTimeField(blank=True, null=True)
    update_opid = models.CharField(max_length=10, blank=True, null=True)
    create_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    update_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ship_via = models.CharField(max_length=20, blank=True, null=True)
    not_needed_after = models.DateTimeField(blank=True, null=True)
    rush = models.CharField(max_length=1, blank=True, null=True)
    claim_interval = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    cancel_interval = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    line_item_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    line_item_subtotal = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    adjustments_subtotal = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    total = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    edi_ref = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    po_approve_date = models.DateTimeField(blank=True, null=True)
    approve_opid = models.CharField(max_length=10, blank=True, null=True)
    approve_location_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    prepay_conversion_rate = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "purchase_order"


class ReserveItemHistory(models.Model):
    item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    effect_date = models.DateTimeField(blank=True, null=True)
    expire_date = models.DateTimeField(blank=True, null=True)
    reserve_charges = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "reserve_item_history"


class Vendor(models.Model):
    vendor_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    vendor_type = models.CharField(max_length=2, blank=True, null=True)
    normal_vendor_type = models.CharField(max_length=2, blank=True, null=True)
    vendor_code = models.CharField(max_length=10, blank=True, null=True)
    normal_vendor_code = models.CharField(max_length=10, blank=True, null=True)
    vendor_name = models.CharField(max_length=60, blank=True, null=True)
    normal_vendor_name = models.CharField(max_length=60, blank=True, null=True)
    federal_tax_id = models.CharField(max_length=10, blank=True, null=True)
    institution_id = models.CharField(max_length=25, blank=True, null=True)
    default_currency = models.CharField(max_length=3, blank=True, null=True)
    claim_interval = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    claim_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    cancel_interval = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ship_via = models.CharField(max_length=20, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    create_opid = models.CharField(max_length=10, blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    update_opid = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "vendor"


class VendorAccount(models.Model):
    account_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    vendor_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    account_number = models.CharField(max_length=25, blank=True, null=True)
    account_name = models.CharField(max_length=25, blank=True, null=True)
    default_po_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    deposit = models.CharField(max_length=1, blank=True, null=True)
    default_discount = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    account_status = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    status_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "vendor_account"


class VendorAddress(models.Model):
    address_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    vendor_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    std_address_number = models.CharField(max_length=8, blank=True, null=True)
    order_address = models.CharField(max_length=1, blank=True, null=True)
    payment_address = models.CharField(max_length=1, blank=True, null=True)
    return_address = models.CharField(max_length=1, blank=True, null=True)
    claim_address = models.CharField(max_length=1, blank=True, null=True)
    email_address = models.CharField(max_length=1, blank=True, null=True)
    other_address = models.CharField(max_length=1, blank=True, null=True)
    contact_name = models.CharField(max_length=40, blank=True, null=True)
    contact_title = models.CharField(max_length=40, blank=True, null=True)
    address_line1 = models.CharField(max_length=50, blank=True, null=True)
    address_line2 = models.CharField(max_length=40, blank=True, null=True)
    address_line3 = models.CharField(max_length=40, blank=True, null=True)
    address_line4 = models.CharField(max_length=40, blank=True, null=True)
    address_line5 = models.CharField(max_length=40, blank=True, null=True)
    city = models.CharField(max_length=30, blank=True, null=True)
    state_province = models.CharField(max_length=7, blank=True, null=True)
    zip_postal = models.CharField(max_length=10, blank=True, null=True)
    country = models.CharField(max_length=20, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "vendor_address"


class VendorBankInfo(models.Model):
    vendor_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    account_number = models.CharField(max_length=25, blank=True, null=True)
    transit_number = models.CharField(max_length=25, blank=True, null=True)
    tax_id_number = models.CharField(max_length=11, blank=True, null=True)
    bank_name = models.CharField(max_length=60, blank=True, null=True)
    address_line1 = models.CharField(max_length=50, blank=True, null=True)
    address_line2 = models.CharField(max_length=40, blank=True, null=True)
    address_line3 = models.CharField(max_length=40, blank=True, null=True)
    address_line4 = models.CharField(max_length=40, blank=True, null=True)
    address_line5 = models.CharField(max_length=40, blank=True, null=True)
    city = models.CharField(max_length=30, blank=True, null=True)
    state_province = models.CharField(max_length=7, blank=True, null=True)
    zip_postal = models.CharField(max_length=10, blank=True, null=True)
    country = models.CharField(max_length=20, blank=True, null=True)
    phone = models.CharField(max_length=25, blank=True, null=True)
    fax = models.CharField(max_length=25, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "vendor_bank_info"


class VendorNote(models.Model):
    vendor_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    note = models.CharField(max_length=1900, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "vendor_note"


class VendorPhone(models.Model):
    address_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    phone_type = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    phone_number = models.CharField(max_length=25, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "vendor_phone"
        unique_together = (("address_id", "phone_type", "phone_number"),)


class VendorTypes(models.Model):
    vendor_type = models.CharField(primary_key=True, max_length=2)
    vendor_type_desc = models.CharField(max_length=40, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "vendor_types"


class ItemView(models.Model):
    item_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    mfhd_id = models.DecimalField(max_digits=38, decimal_places=0)
    item_enum = models.CharField(max_length=80, blank=True, null=True)
    chron = models.CharField(max_length=80, blank=True, null=True)
    year = models.CharField(max_length=20, blank=True, null=True)
    caption = models.CharField(max_length=256, blank=True, null=True)
    freetext = models.CharField(max_length=256, blank=True, null=True)
    item_barcode = models.CharField(max_length=30, blank=True, null=True)
    perm_location = models.CharField(max_length=10, blank=True, null=True)
    temp_location = models.CharField(max_length=10, blank=True, null=True)
    item_type = models.CharField(max_length=25, blank=True, null=True)
    temp_item_type = models.CharField(max_length=25, blank=True, null=True)
    copy_number = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    on_reserve = models.CharField(max_length=1, blank=True, null=True)
    reserve_charges = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    pieces = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    price = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    historical_charges = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    historical_browses = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    recalls_placed = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    holds_placed = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    create_date = models.DateTimeField(blank=True, null=True)
    create_operator_id = models.CharField(max_length=10, blank=True, null=True)
    create_location = models.CharField(max_length=10, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)
    modify_location = models.CharField(max_length=10, blank=True, null=True)
    item_sequence_number = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "item_view"


class VendorView(models.Model):
    vendor_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    vendor_type = models.CharField(max_length=40, blank=True, null=True)
    vendor_code = models.CharField(max_length=10, blank=True, null=True)
    vendor_name = models.CharField(max_length=60, blank=True, null=True)
    institution_id = models.CharField(max_length=25, blank=True, null=True)
    federal_tax_id = models.CharField(max_length=10, blank=True, null=True)
    vendor_note = models.CharField(max_length=1900, blank=True, null=True)
    default_currency = models.CharField(max_length=3, blank=True, null=True)
    claim_interval = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    claim_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    cancel_interval = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    create_date = models.DateTimeField(blank=True, null=True)
    create_operator_id = models.CharField(max_length=10, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "vendor_view"


class VendorAccountView(models.Model):
    vendor_account_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    vendor_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    account_number = models.CharField(max_length=25, blank=True, null=True)
    account_name = models.CharField(max_length=25, blank=True, null=True)
    deposit = models.CharField(max_length=1, blank=True, null=True)
    default_po_type = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "vendor_account_view"


class InvoiceHeaderView(models.Model):
    invoice_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    vendor_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    vendor_code = models.CharField(max_length=10, blank=True, null=True)
    vendor_acccount_number = models.CharField(max_length=25, blank=True, null=True)
    invoice_number = models.CharField(max_length=25, blank=True, null=True)
    invoice_date = models.DateTimeField(blank=True, null=True)
    status = models.CharField(max_length=25, blank=True, null=True)
    status_date = models.DateTimeField(blank=True, null=True)
    voucher_number = models.CharField(max_length=25, blank=True, null=True)
    line_item_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    currency_code = models.CharField(max_length=3, blank=True, null=True)
    conversion_rate = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    invoice_total = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    line_item_subtotal = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    adjustments_subtotal = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    total = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    create_date = models.DateTimeField(blank=True, null=True)
    create_operator_id = models.CharField(max_length=10, blank=True, null=True)
    create_location = models.CharField(max_length=10, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)
    modify_location = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "invoice_header_view"


class InvoiceAdjustmentView(models.Model):
    payment_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    invoice_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    description = models.CharField(max_length=50, blank=True, null=True)
    currency_code = models.CharField(max_length=3, blank=True, null=True)
    raw_amount = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    usd_amount = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    ledger_name = models.CharField(max_length=40, blank=True, null=True)
    fund_name = models.CharField(max_length=25, blank=True, null=True)
    fund_code = models.CharField(max_length=10, blank=True, null=True)
    fau = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "invoice_adjustment_view"


# TODO: May need better primary key as inv_line_item_id will sometimes be repeated...
class InvoiceLineView(models.Model):
    inv_line_item_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    invoice_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    line_item_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    copy_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    unit_price = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    line_price = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    quantity = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    piece_identifier = models.CharField(max_length=500, blank=True, null=True)
    split_fund_seq = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    percentage = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    usd_amount = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    ledger_name = models.CharField(max_length=40, blank=True, null=True)
    fund_name = models.CharField(max_length=25, blank=True, null=True)
    fund_code = models.CharField(max_length=10, blank=True, null=True)
    fau = models.CharField(max_length=50, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    create_operator_id = models.CharField(max_length=10, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "invoice_line_view"


class PoHeaderView(models.Model):
    po_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    vendor_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    vendor_code = models.CharField(max_length=10, blank=True, null=True)
    vendor_acccount_number = models.CharField(max_length=25, blank=True, null=True)
    po_number = models.CharField(max_length=25, blank=True, null=True)
    currency_code = models.CharField(max_length=3, blank=True, null=True)
    conversion_rate = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    po_type = models.CharField(max_length=25, blank=True, null=True)
    po_status = models.CharField(max_length=25, blank=True, null=True)
    status_date = models.DateTimeField(blank=True, null=True)
    approve_date = models.DateTimeField(blank=True, null=True)
    approve_operator_id = models.CharField(max_length=10, blank=True, null=True)
    order_location = models.CharField(max_length=10, blank=True, null=True)
    ship_location = models.CharField(max_length=10, blank=True, null=True)
    bill_location = models.CharField(max_length=10, blank=True, null=True)
    line_item_count = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    note = models.CharField(max_length=1900, blank=True, null=True)
    line_item_subtotal = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    adjustments_subtotal = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    total = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    create_location = models.CharField(max_length=10, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    create_operator_id = models.CharField(max_length=10, blank=True, null=True)
    modify_location = models.CharField(max_length=10, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "po_header_view"


# TODO: May need better primary key as line_item_id will sometimes be repeated...
class PoLineItemView(models.Model):
    line_item_id = models.DecimalField(
        primary_key=True, max_digits=38, decimal_places=0
    )
    po_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    bib_id = models.DecimalField(max_digits=38, decimal_places=0, blank=True, null=True)
    copy_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    mfhd_id = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    title = models.TextField(blank=True, null=True)
    location_code = models.CharField(max_length=10, blank=True, null=True)
    po_number = models.CharField(max_length=25, blank=True, null=True)
    line_item_type = models.CharField(max_length=25, blank=True, null=True)
    line_item_status = models.CharField(max_length=25, blank=True, null=True)
    inv_line_status = models.CharField(max_length=25, blank=True, null=True)
    status_date = models.DateTimeField(blank=True, null=True)
    line_item_number = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    piece_identifier = models.CharField(max_length=50, blank=True, null=True)
    unit_price = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    line_price = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    split_fund_seq = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    percentage = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    raw_amount = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    usd_amount = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )
    quantity = models.DecimalField(
        max_digits=38, decimal_places=0, blank=True, null=True
    )
    ledger_name = models.CharField(max_length=40, blank=True, null=True)
    fund_name = models.CharField(max_length=25, blank=True, null=True)
    fund_code = models.CharField(max_length=10, blank=True, null=True)
    fau = models.CharField(max_length=50, blank=True, null=True)
    note = models.CharField(max_length=1900, blank=True, null=True)
    requestor = models.CharField(max_length=50, blank=True, null=True)
    vendor_title_num = models.CharField(max_length=25, blank=True, null=True)
    vendor_ref_qual = models.CharField(max_length=3, blank=True, null=True)
    vendor_ref_num = models.CharField(max_length=35, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    create_operator_id = models.CharField(max_length=10, blank=True, null=True)
    modify_date = models.DateTimeField(blank=True, null=True)
    modify_operator_id = models.CharField(max_length=10, blank=True, null=True)
    receive_operator_id = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "po_line_item_view"


class AuthRecordView(models.Model):
    auth_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    auth_record = models.TextField(blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "auth_record_view"


class BibRecordView(models.Model):
    bib_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    bib_record = models.TextField(blank=True, null=True)
    suppressed = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "bib_record_view"


class MfhdRecordView(models.Model):
    mfhd_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    mfhd_record = models.TextField(blank=True, null=True)
    suppressed = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "mfhd_record_view"


class BibTitle(models.Model):
    bib_id = models.DecimalField(primary_key=True, max_digits=38, decimal_places=0)
    title = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "bib_title"
