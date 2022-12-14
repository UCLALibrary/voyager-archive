set client_min_messages = WARNING;

/*  Retrieve all item status descriptions for a given item_id,
    concatenated in a string, separated by ', '. 
    Values are in alphabetical order.
*/
drop function if exists get_all_item_status;
create or replace function get_all_item_status(p_item_id numeric) 
returns varchar as $item_status$
declare 
	item_status varchar default '';
	status varchar;
	status_cursor cursor(v_item_id numeric) for
		select item_status_desc
    	from item_status ist
    	inner join item_status_type it on ist.item_status = it.item_status_type
    	where ist.item_id = p_item_id
    	order by item_status_desc;
begin
	item_status := '';
	open status_cursor(p_item_id);
	loop
		fetch status_cursor into status;
		exit when not found;
		item_status := item_status || ', ' || status;
	end loop;
	-- Remove leading comma
	item_status := ltrim(item_status, ',');
	close status_cursor;
	return item_status;
end;
$item_status$ language plpgsql;


/*  Retrieve all item statistical categories for a given item_id,
    concatenated in a string, separated by ', '.
    Values are in alphabetical order.
*/
drop function if exists get_all_item_stat_cats;
create or replace function get_all_item_stat_cats(p_item_id numeric) 
returns varchar as $item_stats$
declare 
	item_stats varchar default '';
	stat varchar;
	stat_cursor cursor(p_item_id numeric) for
		select item_stat_code_desc
    	from item_stats iss
    	inner join item_stat_code isc on iss.item_stat_id = isc.item_stat_id
    	where iss.item_id = p_item_id
    	order by item_stat_code_desc;
begin
	open stat_cursor(p_item_id);
	loop
		fetch stat_cursor into stat;
		exit when not found;
		item_stats := item_stats || ', ' || stat;
	end loop;
	-- Remove leading comma
	item_stats := ltrim(item_stats, ',');
	close stat_cursor;
	return item_stats;
end;
$item_stats$ language plpgsql;


/*  Convert foreign currency amount to US amount in cents,
    given a specific conversion rate.
    All amounts are whole numbers (e.g., 845 is really 8.45).
	Database columns use numeric type, thus function uses that instead of integer.
*/
drop function if exists get_usd_amount;
create or replace function get_usd_amount(foreign_amount numeric, conversion_rate numeric) 
returns numeric as $usd_amount$
declare
	usd_amount numeric default 0;
begin
	-- Special case for US dollars, which has rate 0
	if conversion_rate = 0 then
		return foreign_amount;
	end if;
	
	-- conversion_rate needs to be scaled by 100,000
	usd_amount = (foreign_amount / conversion_rate) * 100000;
	-- Round to nearest whole number
	return round(usd_amount);
end;
$usd_amount$ language plpgsql;
