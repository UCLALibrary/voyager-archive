
BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY bib_master (bib_id,library_id,suppress_in_opac,create_date,update_date,export_ok,export_ok_date,export_ok_opid,export_ok_location_id,export_date,exists_in_dps,exists_in_dps_date) FROM STDIN;
9411434	1	N	2020-12-04 10:50:07	2021-04-30 10:56:33	N	\N	\N	\N	\N	N	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY bib_mfhd (bib_id,mfhd_id) FROM STDIN;
9411434	12507598
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY mfhd_item (mfhd_id,item_id,item_enum,chron,year,caption,freetext) FROM STDIN;
12507598	12066882	v.1-2	\N	\N	\N	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY item_barcode (item_id,item_barcode,barcode_status,barcode_status_date) FROM STDIN;
12066882	L0112367321	1	2020-12-16 05:01:56
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY item (item_id,perm_location,temp_location,item_type_id,temp_item_type_id,copy_number,on_reserve,reserve_charges,pieces,price,spine_label,historical_charges,historical_browses,recalls_placed,holds_placed,create_date,modify_date,create_operator_id,modify_operator_id,create_location_id,modify_location_id,item_sequence_number,historical_bookings,media_type_id,short_loan_charges,magnetic_media,sensitize) FROM STDIN;
12066882	146	0	2	0	0	N	0	1	0	\N	0	0	0	0	2020-12-16 05:01:56	2020-12-16 09:26:46	uclaloader	jtanaka	203	148	1	0	0	0	N	Y
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY purchase_order (po_id,vendor_id,account_id,po_type,po_number,normal_po_number,order_location,ship_location,bill_location,currency_code,conversion_rate,po_status,po_status_date,po_create_date,create_opid,po_update_date,update_opid,create_location_id,update_location_id,ship_via,not_needed_after,rush,claim_interval,cancel_interval,line_item_count,line_item_subtotal,adjustments_subtotal,total,edi_ref,po_approve_date,approve_opid,approve_location_id,prepay_conversion_rate) FROM STDIN;
518017	6718	0	1	EAL518017	EAL518017	147	147	147	USD	0	3	2021-05-21 11:41:22	2020-12-04 10:46:02	jtanaka	2021-06-05 15:31:42	akohler	147	147	\N	\N	0	0	0	4	0	0	0	0	2020-12-09 07:41:45	jtanaka	147	0
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY line_item (line_item_id,po_id,bib_id,line_item_type,line_item_number,piece_identifier,unit_price,line_price,print_std_num,quantity,prepay_amount,rush,claim_interval,cancel_interval,donor,requestor,vendor_title_num,vendor_ref_qual,vendor_ref_num,create_date,create_opid,update_date,update_opid,edi_ref,standard_num) FROM STDIN;
1060976	518017	9411434	0	3	\N	0	0	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	2020-12-04 10:50:07	jtanaka	2021-04-12 09:40:40	jtanaka	\N	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY line_item_copy_status (line_item_id,item_id,location_id,copy_id,mfhd_id,line_item_status,invoice_item_status,status_date,receive_operator) FROM STDIN;
1060976	0	147	1159093	12507598	1	6	2021-05-21 11:41:03	jtanaka
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY invoice (invoice_id,vendor_id,account_id,invoice_number,normal_invoice_number,invoice_status,invoice_status_date,invoice_date,voucher_number,currency_code,conversion_rate,invoice_total,bill_location,invoice_quantity,line_item_count,line_item_subtotal,adjustments_subtotal,total,invoice_create_date,create_opid,create_location_id,invoice_update_date,update_opid,update_location_id,edi_ref,expend_date,check_number,normal_check_number) FROM STDIN;
182740	6718	0	UCLA-058A	UCLA 058A	1	2021-05-26 16:30:28	2020-12-08 00:00:00	182740	USD	0	1657482	202	3	3	1513682	143800	1657482	2021-05-21 11:39:03	jtanaka	202	2021-05-26 16:30:29	abaxley	202	0	\N	\N	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY invoice_line_item (inv_line_item_id,invoice_id,line_item_id,unit_price,line_price,quantity,prepay_amount,piece_identifier,create_date,create_opid,update_date,update_opid,edi_ref) FROM STDIN;
1133653	182740	1060976	291093	291093	1	0	TS	2021-05-21 11:40:41	jtanaka	2021-05-21 12:06:45	jtanaka	0
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY ledger (ledger_id,fiscal_year_id,acq_policy_id,ledger_name,normal_ledger_name,overcommit,overcommit_warn,overcommit_percent,commit_freeze,undercommit_percent,overexpend,overexpend_warn,overexpend_percent,expend_freeze,underexpend_percent,create_date,create_opid,update_date,update_opid,rule_id,new_ledger_name,normal_new_ledger_name,new_ledger_id) FROM STDIN;
326	17	1	EAST ASIAN 20-21	EAST ASIAN 20 21	N	0	0	\N	0	N	0	0	\N	0	2020-07-01 09:12:50	<R>	2020-07-01 09:12:50	\N	32	EAST ASIAN 21-22	EAST ASIAN 21 22	344
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY fund (fund_id,ledger_id,parent_fund,fund_name,normal_fund_name,fund_code,normal_fund_code,category,fund_type,begin_date,end_date,institution_fund_id,expend_only,original_allocation,allocation_increase,allocation_decrease,commit_pending,commitments,expend_pending,expenditures,overcommit,overcommit_warn,overcommit_percent,commit_freeze,undercommit_percent,overexpend,overexpend_warn,overexpend_percent,expend_freeze,underexpend_percent,create_date,create_opid,update_date,update_opid) FROM STDIN;
3777	238	3771	Japanese Mono Prt	JAPANESE MONO PRT	L3MPEAJA-2	L3MPEAJA 2	2	1	\N	\N	4 603800 LM 19900 05 9200 JAPAN	N	0	0	0	0	0	0	9454257	N	0	0	\N	0	N	0	0	\N	0	2016-07-01 07:41:33	<R>	2016-07-01 07:41:33	\N
3777	254	3771	Japanese Mono Prt	JAPANESE MONO PRT	L3MPEAJA-2	L3MPEAJA 2	2	1	\N	\N	4 603800 LM 19900 05 9200 JAPAN	N	0	0	0	0	0	0	4530850	N	0	0	\N	0	N	0	0	\N	0	2017-07-03 11:04:40	<R>	2017-07-03 11:04:40	\N
3777	290	3771	Japanese Mono Prt	JAPANESE MONO PRT	L3MPEAJA-2	L3MPEAJA 2	2	1	\N	\N	4 603800 LM 19900 05 9200 JAPAN	N	0	0	0	0	0	0	7801575	N	0	0	\N	0	N	0	0	\N	0	2018-07-06 11:43:45	<R>	2018-07-06 11:43:45	\N
3777	326	3771	Japanese Mono Prt	JAPANESE MONO PRT	L3MPEAJA-2	L3MPEAJA 2	2	1	\N	\N	4 603800 LM 19900 05 9200 JAPAN	N	0	0	0	0	0	0	9134942	N	0	0	\N	0	N	0	0	\N	0	2020-07-01 09:12:50	<R>	2020-07-01 09:12:50	\N
3777	308	3771	Japanese Mono Prt	JAPANESE MONO PRT	L3MPEAJA-2	L3MPEAJA 2	2	1	\N	\N	4 603800 LM 19900 05 9200 JAPAN	N	0	0	0	0	0	0	8458688	N	0	0	\N	0	N	0	0	\N	0	2019-07-01 09:11:24	<R>	2019-07-01 09:11:24	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY vendor (vendor_id,vendor_type,normal_vendor_type,vendor_code,normal_vendor_code,vendor_name,normal_vendor_name,federal_tax_id,institution_id,default_currency,claim_interval,claim_count,cancel_interval,ship_via,create_date,create_opid,update_date,update_opid) FROM STDIN;
6718	VE	VE	YAGI	YAGI	YAGI Book Store Ltd.	YAGI BOOK STORE LTD	\N	188657001	\N	0	0	0	\N	2004-12-20 14:50:31	rsiao	2017-08-28 12:02:30	ncasner
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY auth_record (auth_id,auth_record) FROM STDIN;
3228675	01003cz  a2200253n  45 0001000800000005001700008008004100025010003100066035002300097040003200120046001500152100006500167400007700232400006800309430003700377642003400414643004600448643003300494644001300527645001900540646001300559670009300572670008400665322867520210609151234.0170412n| azabaaaan          |a aaa     c  ano2017046223zno2005113041  a(OCoLC)oca10763904  aUkOxUbengerdacUkOxUdDLC  k19362edtf0 aAugustine,cof Hippo, Saint,d354-430.tWorks.lLatin.f19360 aAugustine,cof Hippo, Saint,d354-430.tŒuvres de Saint Augustin.f19360 wnneaaAugustine,cSaint, Bishop of Hippo.tWorks.lLatin.f1936 0aOeuvres de Saint Augustin.f1936  asér. 6, v. 40A5DPCC5UkOxU  aParisbInstitut d'Études Augustiniennes  aParisbDesclée, de Brouwer  af5UkOxU  at5DPCC5UkOxU  as5UkOxU  aHomélies sur l'évangile de Saint Jean, 1969:btitle page (Œuvres de Saint Augustin)  aLettres 1-30, 2011:btitle page (Oeuvres de Saint Augustin. 6. série, v. 40A)
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY bib_record (bib_id,bib_record) FROM STDIN;
9411434	02078cam a2200541 i 4500001000800000005001700008008004100025035002200066035002100088035001200109040004200121043001200163050002200175066000700197245006200204880005700266264005900323880005600382300004300438336002600481337002800507338002700535490003500562880003400597500002200631500003800653500003400691599007100725650004300796650004100839650006500880650005100945650006900996650004001065651003701105648002001142655003901162655004101201710003801242880003801280800005601318880005001374910004201424910001601466948003301482949001201515910000901527941143420210430105633.0201215s1992    ja l          000 0 jpn d  a(OCoLC)1226782246  aucoclc1226782246  a9411434  aCLUbengerdacCLUdCLUdOCLCOdOCLCF  aa-ja--- 4aZ186.J3bE37 1992  c$1006880-01aEdo hanpon shūyō /chenshū Fuguruma no Kai.006245-01/$1a江戶版本聚葉 /c編集文車の会. 16880-02aTōkyō :bFuguruma no Kai,cHeisei 4 [1992] 16264-02/$1a東京 :b文車の会,c平成 4 [1992]  a2 volumes :bmounted samples ;c43 cm.  atextbtxt2rdacontent  aunmediatedbn2rdamedia  avolumebnc2rdacarrier1 6880-03aKikansho hyōhonshū1 6490-03/$1a稀覯書標本集  aIssued in a case.  aOn double leaves, oriental style.  aLimited edition of 30 copies.  aNEWbUclaCollMgrbMonosBKS19911994bNew collection customer.207.16 0aEarly printed bookszJapanvSpecimens. 0aPrintingzJapanxHistoryvSpecimens. 0aJapanese prose literatureyEdo period, 1600-1868vSpecimens. 7aEarly printed books.2fast0(OCoLC)fst00900645 7aJapanese prose literaturexEdo period.2fast0(OCoLC)fst01711088 7aPrinting.2fast0(OCoLC)fst01076612 7aJapan.2fast0(OCoLC)fst01204082 7a1600-18682fast 7aHistory.2fast0(OCoLC)fst01411628 7aSpecimens.2fast0(OCoLC)fst014238612 6880-04aFuguruma no Kai,eeditor.2 6710-04/$1a文車の会,eeditor.1 6880-05aSorimachi, Shigeo.tKikansho hyōhonshū.1 6800-05/$1a反町茂雄.t稀覯書標本集.  aUclaCollMgr MonosBKS19911994 20210428  ajt 20201215  aealbjtc20201215d4f2ebks  a9411434  aMARS
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY mfhd_record (mfhd_id,mfhd_record) FROM STDIN;
12507598	00233cv  a22001093  450000100090000000400080000900500170001700700020003400800330003685200440006986600100011312507598941143420201216050156.0t2012040p    8   1001uu   00000000 bea**k**hZ186.J3iE37 1992zIn process 0av.1-2
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY mfhd_master (mfhd_id,location_id,call_no_type,normalized_call_no,display_call_no,suppress_in_opac,source_module,record_status,record_type,encoding_level,field_007,field_008,create_date,update_date,export_ok,export_ok_date,export_ok_opid,export_ok_location_id,export_date) FROM STDIN;
12507598	146	0	Z  186            J 3   E 37   1992	** Z186.J3 E37 1992	N	C	c	v	3	t\036	2012040p    8   1001uu   0000000	2020-12-04 10:50:07	2020-12-16 05:01:56	N	\N	\N	\N	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY po_status (po_status,po_status_desc) FROM STDIN;
0	Pending
1	Approved/Sent
3	Received Partial
4	Received Complete
5	Complete
6	Canceled
\.

COMMIT;


BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY po_type (po_type,po_type_desc) FROM STDIN;
0	Approval
1	Firm Order
2	Gift
3	Exchange
4	Depository
5	Continuation
\.

COMMIT;


BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY invoice_status (invoice_status,invoice_status_desc) FROM STDIN;
0	Pending
1	Approved
4	Complete
5	Canceled
\.

COMMIT;


BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY item_barcode_status (barcode_status_type,barcode_status_desc) FROM STDIN;
1	Active
2	Inactive
\.

COMMIT;


BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY line_item_status (line_item_status,line_item_status_desc) FROM STDIN;
0	Pending
1	Received Complete
2	Backordered
3	Returned
4	Claimed
5	Invoice Pending
6	Invoiced
7	Canceled
8	Approved
9	Received Partial
10	Rolled Over
\.

COMMIT;


BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY item_type (item_type_id,item_type_code,item_type_name,item_type_display) FROM STDIN;
2	book	Book	Book
\.

COMMIT;


BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY location (location_id,location_code,location_name,location_display_name,location_spine_label,location_opac,suppress_in_opac,library_id,mfhd_count) FROM STDIN;
146	ea**	EA Stacks**	East Asian Library Stacks Oversize**	E. Asian;Lib.	Y	N	1	18
\.

COMMIT;
