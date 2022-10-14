set client_min_messages = WARNING;

/*	View of item data.
	Should be one row per item.
*/
drop view if exists item_view;
create or replace view item_view as
select
	i.item_id
,   mi.mfhd_id
,   mi.item_enum
,   mi.chron
,   mi.year
,   mi.caption
,   mi.freetext
,   ib.item_barcode
,	l1.location_code as perm_location
,	(select location_code from location where location_id = i.temp_location) as temp_location
,	itp.item_type_name as item_type
,	(select item_type_name from item_type where item_type_id = i.temp_item_type_id) as temp_item_type
,	i.copy_number
,	i.on_reserve
,	i.reserve_charges
,	i.pieces
,	i.price
,	i.historical_charges
,	i.historical_browses
,	i.recalls_placed
,	i.holds_placed
,	i.create_date
,	i.create_operator_id
,	(select location_code from location where location_id = i.create_location_id) as create_location
,	i.modify_date
,	i.modify_operator_id
,	(select location_code from location where location_id = i.modify_location_id) as modify_location
,	i.item_sequence_number
from item i
inner join mfhd_item mi on i.item_id = mi.item_id
inner join location l1 on i.perm_location = l1.location_id
inner join item_type itp on i.item_type_id = itp.item_type_id
left outer join item_barcode ib on i.item_id = ib.item_id and ib.barcode_status = 1 --Active
;


/*	View of vendor (header-level) data.
	Should be one row per vendor.
*/
drop view if exists vendor_view;
create or replace view vendor_view as
select
	v.vendor_id
,	vt.vendor_type_desc as vendor_type
,	v.vendor_code
,	v.vendor_name
,	v.institution_id
,	v.federal_tax_id
,	vn.note as vendor_note
,	v.default_currency
,	v.claim_interval
,	v.claim_count
,	v.cancel_interval
,	v.create_date
,	v.create_opid as create_operator_id
,	v.update_date as modify_date
,	v.update_opid as modify_operator_id
from vendor v
inner join vendor_types vt on v.vendor_type = vt.vendor_type
left outer join vendor_note vn on v.vendor_id = vn.vendor_id
;


/*	View of vendor account data.
	One row per account; can be multiple rows per vendor,
	though most vendors do not have accounts.
*/
drop view if exists vendor_account_view;
create or replace view vendor_account_view as
select
	va.account_id as vendor_account_id
,	va.vendor_id
,	va.account_number
,	va.account_name
,	va.deposit
,	pot.po_type_desc as default_po_type
from vendor_account va
inner join po_type pot on va.default_po_type = pot.po_type
;


/*	View of invoice header data.
	Should be one row per invoice.
*/
drop view if exists invoice_header_view;
create or replace view invoice_header_view as
select
	i.invoice_id
,	i.vendor_id
,	v.vendor_code
,	va.account_number as vendor_acccount_number
,	i.invoice_number
,	i.invoice_date
,	ist.invoice_status_desc as status
,	i.invoice_status_date as status_date
,	i.voucher_number
,	i.line_item_count
,	i.currency_code
-- conversion_rate needs to be scaled by 100,000
,	i.conversion_rate / 100000 as conversion_rate
--	All of our Voyager currencies use 2 decimal places.
,	get_usd_amount(i.invoice_total, i.conversion_rate) / 100 as invoice_total
,	get_usd_amount(i.line_item_subtotal, i.conversion_rate) / 100 as line_item_subtotal
,	get_usd_amount(i.adjustments_subtotal, i.conversion_rate) / 100 as adjustments_subtotal
,	get_usd_amount(i.total / 100, i.conversion_rate) as total-- may differ from invoice_total due to rounding
,	i.invoice_create_date as create_date
,	i.create_opid as create_operator_id
,	(select location_code from location where location_id = i.create_location_id) as create_location
,	i.invoice_update_date as modify_date
,	i.update_opid as modify_operator_id
,	(select location_code from location where location_id = i.update_location_id) as modify_location
from invoice i
inner join invoice_status ist on i.invoice_status = ist.invoice_status
inner join vendor v on i.vendor_id = v.vendor_id
left outer join vendor_account va on i.account_id = va.account_id
-- Filter out invoices started but never really created
where invoice_number is not null
;


/*	View of invoice price adjustments.
  	We only care about invoice-level adjustments 
  	(tax, freight, fees etc.).
  	No split payments; amounts are in USD.
 	Can be many rows per invoice; not all invoices have these.
 */
-- Only invoice-level adjustments (tax, freight, fees etc.)
drop view if exists invoice_adjustment_view;
create or replace view invoice_adjustment_view as
select
	pa.payment_id
,	pa.object_id as invoice_id
,	ar.reason_text as description
,	i.currency_code
--	All of our Voyager currencies use 2 decimal places.
,	fp.amount / 100 as raw_amount
,	get_usd_amount(fp.amount, i.conversion_rate) / 100 as usd_amount
,	l.ledger_name
,	f.fund_name
,	f.fund_code
,	f.institution_fund_id as fau
from price_adjustment pa
inner join adjust_reason ar on pa.reason_id = ar.reason_id
inner join fund_payment fp on pa.payment_id = fp.payment_id
inner join fund f on fp.ledger_id = f.ledger_id and fp.fund_id = f.fund_id
inner join ledger l on f.ledger_id = l.ledger_id
inner join invoice i on pa.object_id = i.invoice_id
where pa.object_type = 'C'
;


/*	View of invoice line items, including fund information.
	Payments may be split across funds, so there may be
	mulitple rows per invoice line item.
*/
drop view if exists invoice_line_view;
create or replace view invoice_line_view as
select
	ili.invoice_id
,	ili.inv_line_item_id
,	ili.line_item_id
,	ilif.copy_id
--	All of our Voyager currencies use 2 decimal places.
,	ili.unit_price / 100 as unit_price
,	ili.line_price / 100 as line_price
,	ili.quantity
,	ili.piece_identifier
,	ilif.split_fund_seq
,	round((ilif.percentage / 1000000), 2) as percentage
,	ilif.amount / 100 as usd_amount
,	l.ledger_name
,	f.fund_name
,	f.fund_code
,	f.institution_fund_id as fau
,	ili.create_date
,	ili.create_opid as create_operator_id
,	ili.update_date as modify_date
,	ili.update_opid as modify_operator_id
from invoice_line_item ili
inner join invoice_line_item_funds ilif on ili.inv_line_item_id = ilif.inv_line_item_id
inner join fund f on ilif.ledger_id = f.ledger_id and ilif.fund_id = f.fund_id
inner join ledger l on f.ledger_id = l.ledger_id
;


/*	View of purchase order header information.
	Should be one row per purchase order.
*/
drop view if exists po_header_view;
create or replace view po_header_view as
select
	po.po_id
,	po.vendor_id
,	v.vendor_code
,	va.account_number as vendor_acccount_number
,	po.po_number
,	po.currency_code
-- conversion_rate needs to be scaled by 100,000
,	po.conversion_rate / 100000 as conversion_rate
,	pot.po_type_desc as po_type
,	pos.po_status_desc as po_status
,	po.po_status_date as status_date
,	po.po_approve_date as approve_date
,	po.approve_opid as approve_operator_id
,	(select location_code from location where location_id = po.order_location) as order_location
,	(select location_code from location where location_id = po.ship_location) as ship_location
,	(select location_code from location where location_id = po.bill_location) as bill_location
,	po.line_item_count
,	pon.note
--	All amounts need conversion to US dollars
,	get_usd_amount(po.line_item_subtotal, po.conversion_rate) / 100 as line_item_subtotal
,	get_usd_amount(po.adjustments_subtotal, po.conversion_rate) / 100 as adjustments_subtotal
,	get_usd_amount(po.total, po.conversion_rate) / 100 as total
,	(select location_code from location where location_id = po.create_location_id) as create_location
,	po.po_create_date as create_date
,	po.create_opid as create_operator_id
,	(select location_code from location where location_id = po.update_location_id) as modify_location
,	po.po_update_date as modify_date
,	po.update_opid as modify_operator_id
from purchase_order po
inner join po_type pot on po.po_type = pot.po_type
inner join po_status pos on po.po_status = pos.po_status
inner join vendor v on po.vendor_id = v.vendor_id
left outer join vendor_account va on po.account_id = va.account_id
left outer join po_notes pon on po.po_id = pon.po_id
-- Filter out POs started but never really created
where po.vendor_id > 0
;


/*	View of purchase order line items, including fund information.
	Line items can have multiple copies, and those can have multiple funds,
	so there may be multiple rows per PO line item.
*/
drop view if exists po_line_item_view;
create or replace view po_line_item_view as
select
	li.line_item_id
,	li.po_id
,	li.bib_id
,	lics.copy_id
,	lics.mfhd_id
,	bt.title
,	l.location_code
,	po.po_number
,	lit.line_item_type_desc as line_item_type
,	lis.line_item_status_desc as line_item_status
,	(select line_item_status_desc from line_item_status where line_item_status = lics.invoice_item_status) as inv_line_status
,	lics.status_date
,	li.line_item_number
,	li.piece_identifier
--	All amounts need conversion to US dollars
,	get_usd_amount(li.unit_price, po.conversion_rate) / 100 as unit_price
,	get_usd_amount(li.line_price, po.conversion_rate) / 100 as line_price
,	lif.split_fund_seq
,	round((lif.percentage / 1000000), 2) as percentage
,	lif.amount as raw_amount
,	get_usd_amount(lif.amount, po.conversion_rate) / 100 as usd_amount
,	li.quantity
,	lg.ledger_name
,	f.fund_name
,	f.fund_code
,	f.institution_fund_id as fau
,	lin.note
,	li.requestor
,	li.vendor_title_num
,	li.vendor_ref_qual
,	li.vendor_ref_num
,	li.create_date
,	li.create_opid as create_operator_id
,	li.update_date as modify_date
,	li.update_opid as modify_operator_id
,	lics.receive_operator as receive_operator_id
from line_item li
inner join purchase_order po on li.po_id = po.po_id
inner join line_item_type lit on li.line_item_type = lit.line_item_type
inner join line_item_copy_status lics on li.line_item_id = lics.line_item_id
inner join line_item_status lis on lics.line_item_status = lis.line_item_status
inner join line_item_funds lif on lics.copy_id = lif.copy_id
inner join fund f on lif.ledger_id = f.ledger_id and lif.fund_id = f.fund_id
inner join ledger lg on f.ledger_id = lg.ledger_id
inner join location l on lics.location_id = l.location_id
inner join bib_title bt on li.bib_id = bt.bib_id
left outer join line_item_notes lin on li.line_item_id = lin.line_item_id
;


/*	View of authority records.
	Use for consistency with bib and holdings views.
	One row per authority record.
*/
drop view if exists auth_record_view;
create or replace view auth_record_view as
select
	auth_id
,	auth_record
from auth_record
;


/*	View of bibliographic records.
	Adds suppression info.
	One row per bibliographic record.
*/
drop view if exists bib_record_view;
create or replace view bib_record_view as
select
	br.bib_id
,	br.bib_record
,	bm.suppress_in_opac as suppressed
from bib_record br
inner join bib_master bm on br.bib_id = bm.bib_id
;


/*	View of holdings (mfhd) records.
	Adds suppression info.
	One row per holdings record.
*/
drop view if exists mfhd_record_view;
create or replace view mfhd_record_view as
select
	mr.mfhd_id
,	mr.mfhd_record
,	mm.suppress_in_opac as suppressed
from mfhd_record mr
inner join mfhd_master mm on mr.mfhd_id = mm.mfhd_id
;

