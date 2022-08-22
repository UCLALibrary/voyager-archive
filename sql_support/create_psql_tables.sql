-- Generated by Ora2Pg, the Oracle database Schema converter, version 23.1
-- Copyright 2000-2022 Gilles DAROLD. All rights reserved.
-- DATASOURCE: dbi:Oracle:host=localhost;sid=VGER;port=1521
-- Manually edited to remove unwanted tables and add natural primary keys to others where possible.
-- See https://docs.library.ucla.edu/x/wyXjDw for notes on table purposes.

SET client_encoding TO 'UTF8';

\set ON_ERROR_STOP ON

-- Bridge table, no PK
DROP TABLE IF EXISTS account_location ;
CREATE TABLE account_location (
	account_id numeric(38),
	account_location numeric(38)
) ;

-- Bridge table, no PK
DROP TABLE IF EXISTS account_note ;
CREATE TABLE account_note (
	account_id numeric(38),
	vendor_id numeric(38),
	note varchar(1900)
) ;

DROP TABLE IF EXISTS address_type ;
CREATE TABLE address_type (
	address_type numeric(38) primary key,
	address_desc varchar(25)
) ;

DROP TABLE IF EXISTS adjust_reason ;
CREATE TABLE adjust_reason (
	reason_id numeric(38) primary key,
	reason_text varchar(50),
	charge_or_credit char(1),
	reason_edi_code varchar(250),
	vendor_id numeric(38)
) ;

DROP TABLE IF EXISTS bib_master ;
CREATE TABLE bib_master (
	bib_id numeric(38) primary key,
	library_id numeric(38),
	suppress_in_opac char(1),
	create_date timestamp,
	update_date timestamp,
	export_ok char(1),
	export_ok_date timestamp,
	export_ok_opid varchar(10),
	export_ok_location_id numeric(38),
	export_date timestamp,
	exists_in_dps char(1) NOT NULL DEFAULT 'N',
	exists_in_dps_date timestamp
) ;

-- Bridge table, no PK
DROP TABLE IF EXISTS bib_mfhd ;
CREATE TABLE bib_mfhd (
	bib_id numeric(38),
	mfhd_id numeric(38)
) ;
CREATE UNIQUE INDEX bib_mfhd_bibid_mfhdid_idx ON bib_mfhd (bib_id, mfhd_id);
CREATE UNIQUE INDEX bib_mfhd_mfhdid_bibid_idx ON bib_mfhd (mfhd_id, bib_id);

DROP TABLE IF EXISTS call_slip ;
CREATE TABLE call_slip (
	call_slip_id numeric(38) primary key,
	print_group_id numeric(38),
	bib_id numeric(38),
	item_id numeric(38),
	mfhd_id numeric(38),
	patron_id numeric(38),
	patron_group_id numeric(38),
	date_requested timestamp,
	date_processed timestamp,
	location_id numeric(38),
	status numeric(38),
	status_date timestamp,
	status_opid varchar(10),
	no_fill_reason numeric(38),
	item_year varchar(20),
	item_enum varchar(80),
	item_chron varchar(80),
	note varchar(100),
	pickup_location_id numeric(38),
	pickup_db_id numeric(38),
	patron_db_id numeric(38),
	not_needed_after numeric(38),
	reply_note varchar(100)
) ;

DROP TABLE IF EXISTS call_slip_archive ;
CREATE TABLE call_slip_archive (
	archive_id numeric(38) primary key,
	print_group_id numeric(38),
	bib_id numeric(38),
	item_id numeric(38),
	mfhd_id numeric(38),
	patron_id numeric(38),
	patron_group_id numeric(38),
	date_requested timestamp,
	date_processed timestamp,
	location_id numeric(38),
	status numeric(38),
	status_date timestamp,
	status_opid varchar(10),
	no_fill_reason numeric(38),
	item_year varchar(20),
	item_enum varchar(80),
	item_chron varchar(80),
	note varchar(100),
	pickup_location_id numeric(38),
	pickup_db_id numeric(38),
	patron_db_id numeric(38),
	not_needed_after numeric(38),
	reply_note varchar(100)
) ;

DROP TABLE IF EXISTS call_slip_status_type ;
CREATE TABLE call_slip_status_type (
	status_type numeric(38) primary key,
	status_desc varchar(25)
) ;

DROP TABLE IF EXISTS circ_transactions ;
CREATE TABLE circ_transactions (
	circ_transaction_id numeric(38) primary key,
	item_id numeric(38),
	circ_policy_matrix_id numeric(38),
	patron_id numeric(38),
	patron_id_proxy numeric(38),
	patron_group_id numeric(38),
	charge_date timestamp,
	charge_location numeric(38),
	charge_type char(1),
	charge_oper_id varchar(10),
	charge_due_date timestamp,
	discharge_date timestamp,
	discharge_location numeric(38),
	discharge_type char(1),
	discharge_oper_id varchar(10),
	renewal_count numeric(38),
	recall_date timestamp,
	recall_due_date timestamp,
	current_due_date timestamp,
	recall_notice_count numeric(38),
	recall_notice_date timestamp,
	overdue_notice_count numeric(38),
	overdue_notice_date timestamp,
	over_recall_notice_count numeric(38),
	over_recall_notice_date timestamp,
	courtesy_notice_date timestamp,
	db_id numeric(38)
) ;

DROP TABLE IF EXISTS circ_trans_archive ;
CREATE TABLE circ_trans_archive (
	circ_transaction_id numeric(38) primary key,
	item_id numeric(38),
	circ_policy_matrix_id numeric(38),
	patron_group_id numeric(38),
	charge_date timestamp,
	charge_location numeric(38),
	charge_type char(1),
	charge_oper_id varchar(10),
	due_date timestamp,
	discharge_date timestamp,
	discharge_location numeric(38),
	discharge_type char(1),
	discharge_oper_id varchar(10),
	renewal_count numeric(38),
	recall_date timestamp,
	recall_due_date timestamp,
	recall_notice_count numeric(38),
	recall_notice_date timestamp,
	overdue_notice_count numeric(38),
	overdue_notice_date timestamp,
	over_recall_notice_count numeric(38),
	over_recall_notice_date timestamp,
	patron_id numeric(38),
	patron_id_proxy numeric(38),
	courtesy_notice_date timestamp,
	db_id numeric(38)
) ;

DROP TABLE IF EXISTS circ_trans_exception ;
CREATE TABLE circ_trans_exception (
	circ_trans_except_id numeric(38) primary key,
	item_id numeric(38),
	item_location numeric(38),
	patron_id numeric(38),
	trans_except_date timestamp,
	trans_except_location numeric(38),
	trans_except_type numeric(38),
	trans_except_oper_id varchar(10)
) ;

DROP TABLE IF EXISTS circ_trans_except_type ;
CREATE TABLE circ_trans_except_type (
	exception_type numeric(38) primary key,
	exception_desc varchar(50)
) ;

DROP TABLE IF EXISTS claim_types ;
CREATE TABLE claim_types (
	claim_type numeric(38) primary key,
	edi_code varchar(11),
	claim_type_desc varchar(70)
) ;

DROP TABLE IF EXISTS currency_conversion ;
CREATE TABLE currency_conversion (
	currency_id numeric(38) primary key,
	country_name varchar(75),
	normal_country_name varchar(75),
	currency_name varchar(75),
	normal_currency_name varchar(75),
	currency_code varchar(3),
	normal_currency_code varchar(3),
	create_date timestamp,
	create_operator_id varchar(10),
	conversion_rate numeric(38),
	rate_create_date_time timestamp,
	rate_create_operator_id varchar(10),
	decimals numeric(38),
	decimal_delimiter char(1)
) ;

DROP TABLE IF EXISTS fine_fee ;
CREATE TABLE fine_fee (
	fine_fee_id numeric(38) primary key,
	patron_id numeric(38),
	item_id numeric(38),
	create_date timestamp,
	operator_id varchar(10),
	fine_fee_type numeric(38),
	fine_fee_location numeric(38),
	fine_fee_amount numeric(38),
	fine_fee_balance numeric(38),
	fine_fee_note varchar(1000),
	orig_charge_date timestamp,
	due_date timestamp,
	fine_fee_notice_date timestamp,
	db_id numeric(38),
	discharge_date timestamp,
	modify_date timestamp,
	modify_oper_id varchar(10),
	modify_loc_id numeric(38)
) ;

DROP TABLE IF EXISTS fine_fee_transactions ;
CREATE TABLE fine_fee_transactions (
	fine_fee_trans_id numeric(38) primary key,
	fine_fee_id numeric(38),
	trans_date timestamp,
	trans_amount numeric(38),
	trans_type numeric(38),
	trans_method numeric(38),
	trans_location numeric(38),
	operator_id varchar(10),
	trans_note varchar(1000)
) ;

DROP TABLE IF EXISTS fine_fee_trans_method ;
CREATE TABLE fine_fee_trans_method (
	method_type numeric(38) primary key,
	method_desc varchar(25)
) ;

DROP TABLE IF EXISTS fine_fee_trans_type ;
CREATE TABLE fine_fee_trans_type (
	transaction_type numeric(38) primary key,
	transaction_desc varchar(25),
	type_fine char(1),
	type_demerit char(1)
) ;

DROP TABLE IF EXISTS fine_fee_type ;
CREATE TABLE fine_fee_type (
	fine_fee_type numeric(38) primary key,
	fine_fee_desc varchar(25),
	fine_fee_code varchar(10)
) ;

DROP TABLE IF EXISTS fiscal_period ;
CREATE TABLE fiscal_period (
	fiscal_period_id numeric(38) primary key,
	fiscal_period_name varchar(25),
	start_date timestamp,
	end_date timestamp
) ;

-- Fund and ledger combined are unique, no PK
DROP TABLE IF EXISTS fund ;
CREATE TABLE fund (
	fund_id numeric(38),
	ledger_id numeric(38),
	parent_fund numeric(38),
	fund_name varchar(25),
	normal_fund_name varchar(25),
	fund_code varchar(10),
	normal_fund_code varchar(10),
	category numeric(38),
	fund_type numeric(38),
	begin_date timestamp,
	end_date timestamp,
	institution_fund_id varchar(50),
	expend_only char(1),
	original_allocation numeric(38),
	allocation_increase numeric(38),
	allocation_decrease numeric(38),
	commit_pending numeric(38),
	commitments numeric(38),
	expend_pending numeric(38),
	expenditures numeric(38),
	overcommit char(1),
	overcommit_warn numeric(38),
	overcommit_percent numeric(38),
	commit_freeze timestamp,
	undercommit_percent numeric(38),
	overexpend char(1),
	overexpend_warn numeric(38),
	overexpend_percent numeric(38),
	expend_freeze timestamp,
	underexpend_percent numeric(38),
	create_date timestamp,
	create_opid varchar(10),
	update_date timestamp,
	update_opid varchar(10)
) ;
CREATE UNIQUE INDEX fund_idx ON fund (ledger_id, fund_id);

-- Fund and ledger combined are unique, no PK
DROP TABLE IF EXISTS fund_note ;
CREATE TABLE fund_note (
	fund_id numeric(38),
	ledger_id numeric(38),
	fund_note varchar(1900)
) ;
CREATE UNIQUE INDEX fund_note_idx ON fund_note (fund_id, ledger_id);

-- Confirmed all payment_id are unique
DROP TABLE IF EXISTS fund_payment ;
CREATE TABLE fund_payment (
	payment_id numeric(38) primary key,
	split_fund_seq numeric(38),
	ledger_id numeric(38),
	fund_id numeric(38),
	percentage numeric(38),
	amount numeric(38)
) ;

DROP TABLE IF EXISTS fund_transaction ;
CREATE TABLE fund_transaction (
	fund_id numeric(38),
	audit_id numeric(38) primary key,
	ledger_id numeric(38),
	trans_type numeric(38),
	amount numeric(38),
	trans_date timestamp,
	operator_id varchar(10),
	reference_no varchar(25),
	statistical_fund numeric(38),
	note varchar(1900)
) ;

DROP TABLE IF EXISTS fund_type ;
CREATE TABLE fund_type (
	fund_type_id numeric(38) primary key,
	fund_type_name varchar(25),
	commit_warning numeric(38),
	expend_warning numeric(38),
	overcommit_limit numeric(38),
	overexpend_limit numeric(38),
	undercommit numeric(38),
	underexpend numeric(38)
) ;

DROP TABLE IF EXISTS hold_recall ;
CREATE TABLE hold_recall (
	hold_recall_id numeric(38) primary key,
	patron_id numeric(38),
	hold_recall_type char(1),
	pickup_location numeric(38),
	expire_date timestamp,
	available_notice_count numeric(38),
	available_notice_date timestamp,
	create_date timestamp,
	create_opid varchar(10),
	create_location_id numeric(38),
	bib_id numeric(38),
	request_level char(1),
	request_item_count numeric(38),
	request_group_id numeric(38),
	patron_comment varchar(100),
	patron_group_id bigint,
	call_slip_id numeric(38),
	holding_db_id numeric(38),
	modify_opid varchar(10),
	modify_date timestamp,
	modify_location_id numeric(38)
) ;

DROP TABLE IF EXISTS hold_recall_archive ;
CREATE TABLE hold_recall_archive (
	hold_recall_id numeric(38) primary key,
	hold_recall_type char(1),
	pickup_location numeric(38),
	expire_date timestamp,
	available_notice_count numeric(38),
	available_notice_date timestamp,
	create_date timestamp,
	create_opid varchar(10),
	create_location_id numeric(38),
	bib_id numeric(38),
	request_level char(1),
	request_item_count numeric(38),
	request_group_id numeric(38),
	patron_comment varchar(100),
	patron_id bigint,
	patron_group_id bigint,
	call_slip_id numeric(38),
	holding_db_id numeric(38),
	modify_opid varchar(10),
	modify_date timestamp,
	modify_location_id numeric(38)
) ;

-- hold_recall_id is not unique, no PK
DROP TABLE IF EXISTS hold_recall_items ;
CREATE TABLE hold_recall_items (
	hold_recall_id numeric(38),
	item_id numeric(38),
	queue_position numeric(38),
	hold_recall_type char(1),
	hold_recall_status numeric(38),
	hold_recall_status_date timestamp
) ;

-- hold_recall_id is unique here
DROP TABLE IF EXISTS hold_recall_item_archive ;
CREATE TABLE hold_recall_item_archive (
	hold_recall_id numeric(38) primary key,
	item_id numeric(38),
	hold_recall_type char(1),
	hold_recall_status numeric(38),
	hold_recall_status_date timestamp
) ;

DROP TABLE IF EXISTS hold_recall_status ;
CREATE TABLE hold_recall_status (
	hr_status_type numeric(38) primary key,
	hr_status_desc varchar(25)
) ;

DROP TABLE IF EXISTS invoice ;
CREATE TABLE invoice (
	invoice_id numeric(38) primary key,
	vendor_id numeric(38),
	account_id numeric(38),
	invoice_number varchar(25),
	normal_invoice_number varchar(25),
	invoice_status numeric(38),
	invoice_status_date timestamp,
	invoice_date timestamp,
	voucher_number varchar(25),
	currency_code varchar(3),
	conversion_rate numeric(38),
	invoice_total numeric(38),
	bill_location numeric(38),
	invoice_quantity numeric(38),
	line_item_count numeric(38),
	line_item_subtotal numeric(38),
	adjustments_subtotal numeric(38),
	total numeric(38),
	invoice_create_date timestamp,
	create_opid varchar(10),
	create_location_id numeric(38),
	invoice_update_date timestamp,
	update_opid varchar(10),
	update_location_id numeric(38),
	edi_ref numeric(38),
	expend_date timestamp,
	check_number varchar(40),
	normal_check_number varchar(40)
) ;

-- Bridge table, no PK
DROP TABLE IF EXISTS invoice_funds ;
CREATE TABLE invoice_funds (
	invoice_id numeric(38),
	ledger_id numeric(38),
	fund_id numeric(38),
	commit_pending numeric(38),
	commitments numeric(38),
	expend_pending numeric(38),
	expenditures numeric(38)
) ;
CREATE UNIQUE INDEX invoice_funds_idx ON invoice_funds (invoice_id, ledger_id, fund_id);

DROP TABLE IF EXISTS invoice_line_item ;
CREATE TABLE invoice_line_item (
	inv_line_item_id numeric(38) primary key,
	invoice_id numeric(38),
	line_item_id numeric(38),
	unit_price numeric(38),
	line_price numeric(38),
	quantity numeric(38),
	prepay_amount numeric(38),
	piece_identifier varchar(500),
	create_date timestamp,
	create_opid varchar(10),
	update_date timestamp,
	update_opid varchar(10),
	edi_ref numeric(38)
) ;

-- Bridge table, no PK
DROP TABLE IF EXISTS invoice_line_item_funds ;
CREATE TABLE invoice_line_item_funds (
	copy_id numeric(38),
	inv_line_item_id numeric(38),
	split_fund_seq numeric(38),
	ledger_id numeric(38),
	fund_id numeric(38),
	percentage numeric(38),
	amount numeric(38),
	allocation_method char(1) DEFAULT 'P'
) ;
CREATE UNIQUE INDEX invoice_line_item_funds_idx ON invoice_line_item_funds (copy_id, split_fund_seq, inv_line_item_id);

DROP TABLE IF EXISTS invoice_note ;
CREATE TABLE invoice_note (
	invoice_id numeric(38) primary key,
	note varchar(1900)
) ;

DROP TABLE IF EXISTS invoice_status ;
CREATE TABLE invoice_status (
	invoice_status numeric(38) primary key,
	invoice_status_desc varchar(25)
) ;

DROP TABLE IF EXISTS inv_line_item_notes ;
CREATE TABLE inv_line_item_notes (
	inv_line_item_id numeric(38) primary key,
	invoice_id numeric(38),
	note varchar(1900)
) ;

DROP TABLE IF EXISTS item ;
CREATE TABLE item (
	item_id numeric(38) primary key,
	perm_location numeric(38),
	temp_location numeric(38),
	item_type_id numeric(38),
	temp_item_type_id numeric(38),
	copy_number numeric(38),
	on_reserve char(1),
	reserve_charges numeric(38),
	pieces numeric(38),
	price numeric(38),
	spine_label varchar(25),
	historical_charges numeric(38),
	historical_browses numeric(38),
	recalls_placed numeric(38),
	holds_placed numeric(38),
	create_date timestamp,
	modify_date timestamp,
	create_operator_id varchar(10),
	modify_operator_id varchar(10),
	create_location_id numeric(38),
	modify_location_id numeric(38),
	item_sequence_number numeric(38),
	historical_bookings numeric(38),
	media_type_id numeric(38),
	short_loan_charges bigint,
	magnetic_media char(1) DEFAULT 'N',
	sensitize char(1) DEFAULT 'Y'
) ;

-- 1 to many, no PK
DROP TABLE IF EXISTS item_barcode ;
CREATE TABLE item_barcode (
	item_id numeric(38),
	item_barcode varchar(30),
	barcode_status numeric(38),
	barcode_status_date timestamp
) ;

DROP TABLE IF EXISTS item_barcode_status ;
CREATE TABLE item_barcode_status (
	barcode_status_type numeric(38) primary key,
	barcode_status_desc varchar(25)
) ;

-- 1 to many, no PK
DROP TABLE IF EXISTS item_note ;
CREATE TABLE item_note (
	item_id numeric(38),
	item_note varchar(1000),
	item_note_type bigint NOT NULL DEFAULT 1,
	last_modified timestamp
) ;

DROP TABLE IF EXISTS item_note_type ;
CREATE TABLE item_note_type (
	note_type bigint primary key,
	note_desc varchar(20)
) ;

-- Bridge table, no PK
DROP TABLE IF EXISTS item_stats ;
CREATE TABLE item_stats (
	item_id numeric(38),
	item_stat_id numeric(38),
	date_applied timestamp
) ;

-- Bridge table, no PK
DROP TABLE IF EXISTS item_status ;
CREATE TABLE item_status (
	item_id numeric(38),
	item_status numeric(38),
	item_status_date timestamp,
	item_status_operator varchar(10)
) ;

DROP TABLE IF EXISTS item_status_type ;
CREATE TABLE item_status_type (
	item_status_type numeric(38) NOT NULL primary key,
	item_status_desc varchar(25) NOT NULL
) ;

DROP TABLE IF EXISTS item_stat_code ;
CREATE TABLE item_stat_code (
	item_stat_id numeric(38) primary key,
	item_stat_code varchar(3),
	item_stat_code_desc varchar(25)
) ;

DROP TABLE IF EXISTS item_type ;
CREATE TABLE item_type (
	item_type_id numeric(38) primary key,
	item_type_code varchar(10),
	item_type_name varchar(25),
	item_type_display varchar(40)
) ;

DROP TABLE IF EXISTS ledger ;
CREATE TABLE ledger (
	ledger_id numeric(38) primary key,
	fiscal_year_id numeric(38),
	acq_policy_id numeric(38),
	ledger_name varchar(40),
	normal_ledger_name varchar(40),
	overcommit char(1),
	overcommit_warn numeric(38),
	overcommit_percent numeric(38),
	commit_freeze timestamp,
	undercommit_percent numeric(38),
	overexpend char(1),
	overexpend_warn numeric(38),
	overexpend_percent numeric(38),
	expend_freeze timestamp,
	underexpend_percent numeric(38),
	create_date timestamp,
	create_opid varchar(10),
	update_date timestamp,
	update_opid varchar(10),
	rule_id numeric(38),
	new_ledger_name varchar(40),
	normal_new_ledger_name varchar(40),
	new_ledger_id numeric(38)
) ;

DROP TABLE IF EXISTS ledger_note ;
CREATE TABLE ledger_note (
	ledger_id numeric(38) primary key,
	note varchar(1900)
) ;

DROP TABLE IF EXISTS line_item ;
CREATE TABLE line_item (
	line_item_id numeric(38) primary key,
	po_id numeric(38),
	bib_id numeric(38),
	line_item_type numeric(38),
	line_item_number numeric(38),
	piece_identifier varchar(50),
	unit_price numeric(38),
	line_price numeric(38),
	print_std_num char(2),
	quantity numeric(38),
	prepay_amount numeric(38),
	rush char(1),
	claim_interval numeric(38),
	cancel_interval numeric(38),
	donor varchar(50),
	requestor varchar(50),
	vendor_title_num varchar(25),
	vendor_ref_qual varchar(3),
	vendor_ref_num varchar(35),
	create_date timestamp,
	create_opid varchar(10),
	update_date timestamp,
	update_opid varchar(10),
	edi_ref numeric(38),
	standard_num varchar(50)
) ;

-- 1-to-many, no PK
DROP TABLE IF EXISTS line_item_copy ;
CREATE TABLE line_item_copy (
	line_item_id numeric(38),
	location_id numeric(38),
	ship_to_location numeric(38),
	copy_count numeric(38),
	use_ledger numeric(38),
	use_fund numeric(38)
) ;
CREATE UNIQUE INDEX line_item_copy_idx ON line_item_copy (line_item_id, location_id);

DROP TABLE IF EXISTS line_item_copy_status ;
CREATE TABLE line_item_copy_status (
	line_item_id numeric(38),
	item_id numeric(38),
	location_id numeric(38),
	copy_id numeric(38) primary key,
	mfhd_id numeric(38),
	line_item_status numeric(38),
	invoice_item_status numeric(38),
	status_date timestamp,
	receive_operator varchar(10)
) ;

-- 1-to-many, no PK
DROP TABLE IF EXISTS line_item_funds ;
CREATE TABLE line_item_funds (
	copy_id numeric(38),
	split_fund_seq numeric(38),
	ledger_id numeric(38),
	fund_id numeric(38),
	percentage numeric(38),
	prepay_percentage numeric(38),
	amount numeric(38),
	prepay numeric(38),
	allocation_method char(1) DEFAULT 'P'
) ;
CREATE UNIQUE INDEX line_item_funds_idx ON line_item_funds (copy_id, split_fund_seq);

DROP TABLE IF EXISTS line_item_notes ;
CREATE TABLE line_item_notes (
	line_item_id numeric(38) primary key,
	po_id numeric(38),
	print_note varchar(60),
	note varchar(1900)
) ;

DROP TABLE IF EXISTS line_item_status ;
CREATE TABLE line_item_status (
	line_item_status numeric(38) primary key,
	line_item_status_desc varchar(25)
) ;

DROP TABLE IF EXISTS line_item_type ;
CREATE TABLE line_item_type (
	line_item_type numeric(38) primary key,
	line_item_type_desc varchar(25)
) ;

DROP TABLE IF EXISTS location ;
CREATE TABLE location (
	location_id numeric(38) primary key,
	location_code varchar(10),
	location_name varchar(25),
	location_display_name varchar(60),
	location_spine_label varchar(25),
	location_opac char(1),
	suppress_in_opac char(1),
	library_id numeric(38),
	mfhd_count numeric(38)
) ;

-- 1-to-many, no PK
DROP TABLE IF EXISTS mfhd_item ;
CREATE TABLE mfhd_item (
	mfhd_id numeric(38),
	item_id numeric(38),
	item_enum varchar(80),
	chron varchar(80),
	year varchar(20),
	caption varchar(256),
	freetext varchar(256)
) ;
CREATE UNIQUE INDEX mfhd_item_item_idx ON mfhd_item (item_id, mfhd_id);
CREATE UNIQUE INDEX mfhd_item_mfhd_idx ON mfhd_item (mfhd_id, item_id);

DROP TABLE IF EXISTS mfhd_master ;
CREATE TABLE mfhd_master (
	mfhd_id numeric(38) primary key,
	location_id numeric(38),
	call_no_type char(1),
	normalized_call_no varchar(300),
	display_call_no varchar(300),
	suppress_in_opac char(1),
	source_module char(1),
	record_status char(1),
	record_type char(1),
	encoding_level char(1),
	field_007 varchar(23),
	field_008 varchar(32),
	create_date timestamp,
	update_date timestamp,
	export_ok char(1),
	export_ok_date timestamp,
	export_ok_opid varchar(10),
	export_ok_location_id numeric(38),
	export_date timestamp
) ;

DROP TABLE IF EXISTS note_type ;
CREATE TABLE note_type (
	note_type numeric(38) primary key,
	note_desc varchar(25)
) ;

DROP TABLE IF EXISTS no_fill_reason ;
CREATE TABLE no_fill_reason (
	reason_id numeric(38) primary key,
	reason_code varchar(10),
	reason_desc varchar(50),
	suppress char(1)
) ;

DROP TABLE IF EXISTS operator ;
CREATE TABLE operator (
	operator_id varchar(10) primary key,
	first_name varchar(25),
	middle_initial varchar(1),
	last_name varchar(25),
	create_date timestamp,
	create_opid varchar(10),
	modify_date timestamp,
	modify_opid varchar(10),
	never_expire char(1) NOT NULL DEFAULT 'N',
	manual_expire char(1) NOT NULL DEFAULT 'N',
	invalid_login_time timestamp,
	lockout_time timestamp,
	lockout_counter numeric(22),
	restrict_password_change char(1) NOT NULL DEFAULT 'N'
) ;

DROP TABLE IF EXISTS order_types ;
CREATE TABLE order_types (
	order_type numeric(38) primary key,
	order_type_desc varchar(25)
) ;

DROP TABLE IF EXISTS patron ;
CREATE TABLE patron (
	patron_id numeric(38) primary key,
	name_type numeric(38),
	last_name varchar(50),
	normal_last_name varchar(50),
	first_name varchar(50),
	normal_first_name varchar(50),
	middle_name varchar(50),
	normal_middle_name varchar(50),
	title varchar(20),
	ssan varchar(11),
	institution_id varchar(30),
	normal_institution_id varchar(30),
	registration_date timestamp,
	create_operator_id varchar(10),
	home_location numeric(38),
	create_date timestamp,
	modify_operator_id varchar(10),
	modify_location_id numeric(38),
	modify_date timestamp,
	expire_date timestamp,
	purge_date timestamp,
	current_charges numeric(38),
	total_fees_due numeric(38),
	note_count numeric(38),
	current_hold_shelf numeric(38),
	recalls_placed numeric(38),
	holds_placed numeric(38),
	items_recalled numeric(38),
	historical_charges numeric(38),
	claims_return numeric(38),
	lost_items numeric(38),
	self_shelved numeric(38),
	counter_reset_date timestamp,
	counter_reset_oper_id varchar(10),
	current_bookings numeric(38),
	late_media_returns numeric(38),
	historical_bookings numeric(38),
	cancelled_bookings numeric(38),
	unclaimed_bookings numeric(38),
	media_counter_reset_date timestamp,
	media_counter_reset_opid varchar(10),
	current_call_slips numeric(38),
	historical_call_slips numeric(38),
	historical_distributions numeric(38),
	current_short_loans bigint,
	historical_short_loans bigint,
	unclaimed_short_loans bigint,
	db_id numeric(38),
	patron_id_ub numeric(38),
	current_charges_ub numeric(38),
	historical_charges_ub numeric(38),
	requests_ub numeric(38),
	historical_requests_ub numeric(38),
	claims_return_ub numeric(38),
	lost_items_ub numeric(38),
	total_fees_due_ub numeric(38),
	self_shelved_ub numeric(38),
	patron_pin varchar(12),
	suspension_date timestamp,
	total_demerits numeric(38),
	total_demerits_due_ub numeric(38),
	sms_number varchar(50),
	birth_date timestamp,
	major varchar(50),
	department varchar(50)
) ;

DROP TABLE IF EXISTS patron_address ;
CREATE TABLE patron_address (
	address_id numeric(38),
	patron_id numeric(38),
	address_type numeric(38),
	address_status char(1),
	protect_address char(1),
	address_line1 varchar(100),
	address_line2 varchar(100),
	address_line3 varchar(100),
	address_line4 varchar(100),
	address_line5 varchar(100),
	city varchar(40),
	state_province varchar(7),
	zip_postal varchar(10),
	country varchar(20),
	effect_date timestamp,
	expire_date timestamp,
	modify_date timestamp,
	modify_operator_id varchar(10)
) ;
CREATE UNIQUE INDEX patron_address_idx ON patron_address (address_id);
CREATE INDEX patron_address_ptn_idx ON patron_address (patron_id);

DROP TABLE IF EXISTS patron_barcode ;
CREATE TABLE patron_barcode (
	patron_barcode_id numeric(38),
	patron_id numeric(38),
	patron_group_id numeric(38),
	patron_barcode varchar(25),
	barcode_status numeric(38),
	barcode_status_date timestamp,
	modify_operator_id varchar(10),
	home_barcode_id numeric(38),
	home_patron_group_id numeric(38)
) ;
CREATE INDEX patron_barcode_pbc_idx ON patron_barcode (patron_barcode);
CREATE INDEX patron_barcode_pgid_idx ON patron_barcode (patron_group_id);
CREATE UNIQUE INDEX patron_barcode_ptn_bcd_id_idx ON patron_barcode (patron_barcode_id);
CREATE INDEX patron_barcode_ptn_idx ON patron_barcode (patron_id);

DROP TABLE IF EXISTS patron_barcode_status ;
CREATE TABLE patron_barcode_status (
	barcode_status_type numeric(38),
	barcode_status_desc varchar(25)
) ;

DROP TABLE IF EXISTS patron_group ;
CREATE TABLE patron_group (
	patron_group_id numeric(38),
	patron_group_code varchar(10),
	patron_group_name varchar(25),
	patron_group_display varchar(40),
	demerits_applies char(1),
	max_demerits numeric(38),
	suspension_days numeric(38),
	circ_cluster_id numeric(38),
	charged_status_display char(1),
	charge_limit bigint,
	charge_limit_apply char(1)
) ;
CREATE UNIQUE INDEX patron_group_idx ON patron_group (patron_group_id);

DROP TABLE IF EXISTS patron_group_item_type ;
CREATE TABLE patron_group_item_type (
	patron_group_id bigint,
	item_type_id bigint,
	charge_limit bigint
) ;

DROP TABLE IF EXISTS patron_group_policy ;
CREATE TABLE patron_group_policy (
	circ_group_id numeric(38),
	patron_group_id numeric(38),
	fees_applies char(1),
	max_outstanding_balance numeric(38),
	overdue_notice_applies char(1),
	min_balance_for_notice numeric(38),
	max_item_limit char(1),
	item_limit numeric(38),
	max_overdue_limit char(1),
	overdue_limit numeric(38),
	max_overdue_recall_limit char(1),
	overdue_recall_limit numeric(38),
	max_recall_limit char(1),
	recall_limit numeric(38),
	max_self_shelve_limit char(1),
	self_shelve_limit numeric(38),
	max_claim_return_limit char(1),
	claim_return_limit numeric(38),
	max_lost_limit char(1),
	lost_limit numeric(38),
	place_hold_outside_lib char(1),
	place_hold_inside_lib char(1),
	place_recall_outside_lib char(1),
	place_recall_inside_lib char(1),
	place_interlib_loan_req char(1),
	place_purchase_req char(1),
	courtesy_notice_applies char(1),
	call_slip_limit numeric(38),
	max_call_slips char(1),
	place_call_slips char(1),
	email_courtesy_notice char(1),
	email_cancellation_notice char(1),
	email_item_available_notice char(1),
	email_overdue_notice char(1),
	email_overdue_notice_other char(1),
	email_overdue_recall_notice char(1),
	email_recall_notice char(1),
	place_short_loan_in_lib char(1),
	max_total_short_loan char(1),
	total_short_loan bigint DEFAULT 0,
	max_title_short_loan char(1),
	title_short_loan bigint DEFAULT 0,
	max_day_short_loan char(1),
	day_short_loan bigint DEFAULT 0,
	hold_request_limit bigint DEFAULT 0,
	max_hold_request char(1),
	include_hold_in_borrow_limit char(1)
) ;
CREATE INDEX patron_group_policy_idx ON patron_group_policy (circ_group_id, patron_group_id);

DROP TABLE IF EXISTS patron_name_type ;
CREATE TABLE patron_name_type (
	patron_name_type numeric(38),
	patron_name_desc varchar(25)
) ;

DROP TABLE IF EXISTS patron_notes ;
CREATE TABLE patron_notes (
	patron_note_id numeric(38),
	patron_id numeric(38),
	note_type numeric(38),
	address_id numeric(38),
	note varchar(1900),
	modify_date timestamp,
	modify_operator_id varchar(10)
) ;
CREATE INDEX patron_notes_pat_id_idx ON patron_notes (patron_id);
CREATE UNIQUE INDEX patron_notes_pat_note_id_idx ON patron_notes (patron_note_id);

DROP TABLE IF EXISTS patron_phone ;
CREATE TABLE patron_phone (
	patron_phone_id numeric(38),
	address_id numeric(38),
	phone_type numeric(38),
	phone_number varchar(25),
	modify_date timestamp,
	modify_operator_id varchar(10)
) ;
CREATE INDEX patron_phone_addr_id_idx ON patron_phone (address_id);
CREATE UNIQUE INDEX patron_phone_id_idx ON patron_phone (patron_phone_id);

DROP TABLE IF EXISTS patron_stats ;
CREATE TABLE patron_stats (
	patron_id numeric(38),
	patron_stat_id numeric(38),
	date_applied timestamp
) ;
CREATE INDEX patron_stats_pst_id_idx ON patron_stats (patron_stat_id);
CREATE INDEX patron_stats_ptnid_idx ON patron_stats (patron_id);

DROP TABLE IF EXISTS patron_stat_code ;
CREATE TABLE patron_stat_code (
	patron_stat_id numeric(38),
	patron_stat_code varchar(3),
	patron_stat_desc varchar(25)
) ;
CREATE UNIQUE INDEX patron_stat_code_idx ON patron_stat_code (patron_stat_id);
CREATE UNIQUE INDEX patron_stat_code_idx2 ON patron_stat_code (patron_stat_code);

DROP TABLE IF EXISTS phone_type ;
CREATE TABLE phone_type (
	phone_type numeric(38) primary key,
	phone_desc varchar(25)
) ;

-- Bridge table, no PK
DROP TABLE IF EXISTS po_funds ;
CREATE TABLE po_funds (
	po_id numeric(38),
	ledger_id numeric(38),
	fund_id numeric(38),
	commit_pending numeric(38),
	commitments numeric(38),
	expend_pending numeric(38),
	expenditures numeric(38)
) ;
CREATE UNIQUE INDEX po_funds_idx ON po_funds (po_id, ledger_id, fund_id);

DROP TABLE IF EXISTS po_notes ;
CREATE TABLE po_notes (
	po_id numeric(38) primary key,
	print_note varchar(60),
	note varchar(1900)
) ;

DROP TABLE IF EXISTS po_status ;
CREATE TABLE po_status (
	po_status numeric(38) primary key,
	po_status_desc varchar(25)
) ;

DROP TABLE IF EXISTS po_type ;
CREATE TABLE po_type (
	po_type numeric(38) primary key,
	po_type_desc varchar(25)
) ;

-- 1-to-many, no PK - payment_id is not unique
DROP TABLE IF EXISTS price_adjustment ;
CREATE TABLE price_adjustment (
	object_type char(1),
	object_id numeric(38),
	sequence numeric(38),
	reason_id numeric(38),
	method numeric(38),
	adjust_amount numeric(38),
	payment_id numeric(38)
) ;
CREATE UNIQUE INDEX price_adjustment_idx ON price_adjustment (object_type, object_id, sequence);

-- Bridge table, no PK
DROP TABLE IF EXISTS proxy_patron ;
CREATE TABLE proxy_patron (
	patron_barcode_id numeric(38),
	patron_barcode_id_proxy numeric(38),
	create_date timestamp,
	create_opid varchar(10),
	create_location numeric(38),
	expiration_date timestamp
) ;

DROP TABLE IF EXISTS purchase_order ;
CREATE TABLE purchase_order (
	po_id numeric(38) primary key,
	vendor_id numeric(38),
	account_id numeric(38),
	po_type numeric(38),
	po_number varchar(25),
	normal_po_number varchar(25),
	order_location numeric(38),
	ship_location numeric(38),
	bill_location numeric(38),
	currency_code varchar(3),
	conversion_rate numeric(38),
	po_status numeric(38),
	po_status_date timestamp,
	po_create_date timestamp,
	create_opid varchar(10),
	po_update_date timestamp,
	update_opid varchar(10),
	create_location_id numeric(38),
	update_location_id numeric(38),
	ship_via varchar(20),
	not_needed_after timestamp,
	rush char(1),
	claim_interval numeric(38),
	cancel_interval numeric(38),
	line_item_count numeric(38),
	line_item_subtotal numeric(38),
	adjustments_subtotal numeric(38),
	total numeric(38),
	edi_ref numeric(38),
	po_approve_date timestamp,
	approve_opid varchar(10),
	approve_location_id numeric(38),
	prepay_conversion_rate numeric(38)
) ;


-- 1-to-many, no PK
DROP TABLE IF EXISTS reserve_item_history ;
CREATE TABLE reserve_item_history (
	item_id numeric(38),
	effect_date timestamp,
	expire_date timestamp,
	reserve_charges numeric(38)
) ;

DROP TABLE IF EXISTS vendor ;
CREATE TABLE vendor (
	vendor_id numeric(38) primary key,
	vendor_type char(2),
	normal_vendor_type char(2),
	vendor_code varchar(10),
	normal_vendor_code varchar(10),
	vendor_name varchar(60),
	normal_vendor_name varchar(60),
	federal_tax_id varchar(10),
	institution_id varchar(25),
	default_currency varchar(3),
	claim_interval numeric(38),
	claim_count numeric(38),
	cancel_interval numeric(38),
	ship_via varchar(20),
	create_date timestamp,
	create_opid varchar(10),
	update_date timestamp,
	update_opid varchar(10)
) ;

DROP TABLE IF EXISTS vendor_account ;
CREATE TABLE vendor_account (
	account_id numeric(38) primary key,
	vendor_id numeric(38),
	account_number varchar(25),
	account_name varchar(25),
	default_po_type numeric(38),
	deposit char(1),
	default_discount numeric(38),
	account_status numeric(38),
	status_date timestamp
) ;

DROP TABLE IF EXISTS vendor_address ;
CREATE TABLE vendor_address (
	address_id numeric(38) primary key,
	vendor_id numeric(38),
	std_address_number varchar(8),
	order_address char(1),
	payment_address char(1),
	return_address char(1),
	claim_address char(1),
	email_address char(1),
	other_address char(1),
	contact_name varchar(40),
	contact_title varchar(40),
	address_line1 varchar(50),
	address_line2 varchar(40),
	address_line3 varchar(40),
	address_line4 varchar(40),
	address_line5 varchar(40),
	city varchar(30),
	state_province varchar(7),
	zip_postal varchar(10),
	country varchar(20),
	modify_date timestamp,
	modify_operator_id varchar(10)
) ;

DROP TABLE IF EXISTS vendor_bank_info ;
CREATE TABLE vendor_bank_info (
	vendor_id numeric(38) primary key,
	account_number varchar(25),
	transit_number varchar(25),
	tax_id_number varchar(11),
	bank_name varchar(60),
	address_line1 varchar(50),
	address_line2 varchar(40),
	address_line3 varchar(40),
	address_line4 varchar(40),
	address_line5 varchar(40),
	city varchar(30),
	state_province varchar(7),
	zip_postal varchar(10),
	country varchar(20),
	phone varchar(25),
	fax varchar(25),
	modify_date timestamp,
	modify_operator_id varchar(10)
) ;

DROP TABLE IF EXISTS vendor_note ;
CREATE TABLE vendor_note (
	vendor_id numeric(38) primary key,
	note varchar(1900)
) ;

-- 1-to-many, no PK
DROP TABLE IF EXISTS vendor_phone ;
CREATE TABLE vendor_phone (
	address_id numeric(38),
	phone_type numeric(38),
	phone_number varchar(25),
	modify_date timestamp,
	modify_operator_id varchar(10)
) ;
CREATE UNIQUE INDEX vendor_phone_idx ON vendor_phone (address_id, phone_type, phone_number);

DROP TABLE IF EXISTS vendor_types ;
CREATE TABLE vendor_types (
	vendor_type char(2) primary key,
	vendor_type_desc char(40)
) ;

/*
* Non-Voyager tables, replacing auth_data / bib_data / mfhd_data
*/

-- Using authority_record to avoid confusion with Django's Auth models
DROP TABLE IF EXISTS authority_record ;
CREATE TABLE authority_record (
	auth_id numeric(38) primary key,
	auth_record text
) ;

DROP TABLE IF EXISTS bib_record ;
CREATE TABLE bib_record (
	bib_id numeric(38) primary key,
	bib_record text
) ;

DROP TABLE IF EXISTS mfhd_record ;
CREATE TABLE mfhd_record (
	mfhd_id numeric(38) primary key,
	mfhd_record text
) ;


