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
