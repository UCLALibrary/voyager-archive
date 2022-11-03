-- Create indexes not already created via table DDL.
-- Does not include Django admin tables, which are created / indexed by Django.
-- *** DO NOT RUN THIS SCRIPT - created to document work for SYS-1053 ***

\set ON_ERROR_STOP ON

create unique index item_pkey on public.item using btree (item_id);
create index item_barcode_barcode_idx on public.item_barcode using btree (item_barcode);
create index item_barcode_item_id on public.item_barcode using btree (item_id);
create index mfhd_item_mfhd_id on public.mfhd_item using btree (mfhd_id);
create index mfhd_item_item_id on public.mfhd_item using btree (item_id);
create index bib_mfhd_bib_id on public.bib_mfhd using btree (bib_id);
create index bib_mfhd_mfhd_id on public.bib_mfhd using btree (mfhd_id);
create unique index purchase_order_pkey on public.purchase_order using btree (po_id);
create index purchase_order_po_number on public.purchase_order using btree (po_number);
create index invoice_invoice_number on public.invoice using btree (invoice_number);
create unique index vendor_pkey on public.vendor using btree (vendor_id);
create index vendor_vendor_code on public.vendor using btree (vendor_code);
create unique index location_pkey on public.location using btree (location_id);
create index item_perm_location on public.item using btree (perm_location);
create index item_item_type_id on public.item using btree (item_type_id);
create unique index item_type_pkey on public.item_type using btree (item_type_id);
create index invoice_vendor_id on public.invoice using btree (vendor_id);
create index purchase_order_vendor_id on public.purchase_order using btree (vendor_id);
create index price_adjustment_payment_id on public.price_adjustment using btree (payment_id);
create index fund_payment_payment_id on public.fund_payment using btree (payment_id);
create index ledger_pkey on public.ledger using btree (ledger_id);
create unique index fund_ledger_id_fund_id on public.fund using btree (ledger_id, fund_id);
create index price_adjustment_object_id on public.price_adjustment using btree (object_id);
create unique index item_stat_code_pkey on public.item_stat_code using btree (item_stat_id);
create index item_stats_item_id on public.item_stats using btree (item_id);
create index item_stats_item_stat_id on public.item_stats using btree (item_stat_id);
create unique index item_status_type_pkey on public.item_status_type using btree (item_status_type);
create index item_status_item_id on public.item_status using btree (item_id);
create index item_status_item_status on public.item_status using btree (item_status);
commit;

-- List index info
select * 
from pg_indexes 
where schemaname = 'public'
and (tablename not like 'django%' and tablename not like 'auth_group%' and tablename not like 'auth_permission%' and tablename not like 'auth_user%')
order by tablename;
