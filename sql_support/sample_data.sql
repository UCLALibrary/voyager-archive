
BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY bib_master (bib_id,library_id,suppress_in_opac,create_date,update_date,export_ok,export_ok_date,export_ok_opid,export_ok_location_id,export_date,exists_in_dps,exists_in_dps_date) FROM STDIN;
9411434	1	N	2020-12-04 10:50:07	2021-04-30 10:56:33	N	\N	\N	\N	\N	N	\N
4507	1	N	2004-05-21 00:00:00	2021-04-22 14:35:05	N	\N	\N	\N	\N	N	\N
9467582	1	N	2021-05-06 16:25:15	2021-05-07 05:19:23	N	\N	\N	\N	\N	N	\N
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
12507598	99999999	v.1-2	\N	\N	\N	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY item_barcode (item_id,item_barcode,barcode_status,barcode_status_date) FROM STDIN;
12066882	L0112367321	1	2020-12-16 05:01:56
99999999	L0112367321	1	2020-12-16 05:01:56
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY item (item_id,perm_location,temp_location,item_type_id,temp_item_type_id,copy_number,on_reserve,reserve_charges,pieces,price,spine_label,historical_charges,historical_browses,recalls_placed,holds_placed,create_date,modify_date,create_operator_id,modify_operator_id,create_location_id,modify_location_id,item_sequence_number,historical_bookings,media_type_id,short_loan_charges,magnetic_media,sensitize) FROM STDIN;
12066882	146	0	2	0	0	N	0	1	0	\N	0	0	0	0	2020-12-16 05:01:56	2020-12-16 09:26:46	uclaloader	jtanaka	203	148	1	0	0	0	N	Y
99999999	146	0	2	0	0	N	0	1	0	\N	0	0	0	0	2020-12-16 05:01:56	2020-12-16 09:26:46	uclaloader	jtanaka	203	148	1	0	0	0	N	Y
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
1060974	0	147	1159091	12507596	1	6	2021-05-21 11:40:41	jtanaka
1060976	0	147	1159093	12507598	1	6	2021-05-21 11:41:03	jtanaka
1060977	0	147	1159094	12507599	1	6	2021-05-21 11:41:22	jtanaka
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
1133652	182740	1060974	853872	853872	1	0	TM	2021-05-21 11:40:04	jtanaka	2021-05-21 11:40:41	jtanaka	0
1133653	182740	1060976	291093	291093	1	0	TS	2021-05-21 11:40:41	jtanaka	2021-05-21 12:06:45	jtanaka	0
1133654	182740	1060977	368717	368717	1	0	TM	2021-05-21 11:41:03	jtanaka	2021-05-21 11:47:09	jtanaka	0
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY ledger (ledger_id,fiscal_year_id,acq_policy_id,ledger_name,normal_ledger_name,overcommit,overcommit_warn,overcommit_percent,commit_freeze,undercommit_percent,overexpend,overexpend_warn,overexpend_percent,expend_freeze,underexpend_percent,create_date,create_opid,update_date,update_opid,rule_id,new_ledger_name,normal_new_ledger_name,new_ledger_id) FROM STDIN;
326	17	1	EAST ASIAN 20-21	EAST ASIAN 20 21	N	0	0	\N	0	N	0	0	\N	0	2020-07-01 09:12:50	<R>	2020-07-01 09:12:50	\N	32	EAST ASIAN 21-22	EAST ASIAN 21 22	344
336	17	1	MUSIC 20-21	MUSIC 20 21	N	0	0	\N	0	N	0	0	\N	0	2020-07-01 09:12:53	<R>	2020-07-01 09:12:53	\N	32	MUSIC 21-22	MUSIC 21 22	354
355	18	1	IS 21-22	IS 21 22	N	0	0	\N	0	N	0	0	\N	0	2021-06-05 06:00:08	<R>	2021-06-05 06:00:08	\N	0	\N	\N	0
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
6758	355	6757	Western European Mono	WESTERN EUROPEAN MONO	1IS117	1IS117	1	1	\N	\N	4 606800 LM 18082 05 9200	N	2662600	0	0	0	450986	0	0	Y	115	115	\N	0	Y	115	115	\N	0	2021-06-05 06:00:08	<R>	2021-06-08 16:19:23	asallen
4717	336	4703	Music Mono Scores	MUSIC MONO SCORES	L3MSMUMU-2	L3MSMUMU 2	2	1	\N	\N	4 603520 LM 19900 05 9200	N	0	0	0	0	0	0	1678948	N	0	0	\N	0	N	0	0	\N	0	2020-07-01 09:12:53	<R>	2020-07-01 09:12:53	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY vendor (vendor_id,vendor_type,normal_vendor_type,vendor_code,normal_vendor_code,vendor_name,normal_vendor_name,federal_tax_id,institution_id,default_currency,claim_interval,claim_count,cancel_interval,ship_via,create_date,create_opid,update_date,update_opid) FROM STDIN;
6718	VE	VE	YAGI	YAGI	YAGI Book Store Ltd.	YAGI BOOK STORE LTD	\N	188657001	\N	0	0	0	\N	2004-12-20 14:50:31	rsiao	2017-08-28 12:02:30	ncasner
2264	VE	VE	HAR	HAR	Harrassowitz	HARRASSOWITZ	\N	006800004	\N	0	0	0	\N	2004-06-04 11:33:09	CONVERSION	2017-12-15 09:43:20	ncasner
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
147	eaacq	*East Asian Acquisitions	East Asian Library Acquisitions Department	\N	Y	N	1	1208
292	muacq	*Music Acq Dept	Music Library Acquisitions Department	\N	Y	N	1	107
575	musmon	+Music Monographs	\N	\N	\N	Y	1	0
288	mu	Music Stacks	Music Library	Music Lib.	Y	N	1	83383
460	yr	YRL Stacks	YRL	\N	Y	N	1	1516861
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY line_item_copy_status (line_item_id,item_id,location_id,copy_id,mfhd_id,line_item_status,invoice_item_status,status_date,receive_operator) FROM STDIN;
75438	0	460	128592	4216553	8	0	2004-10-20 14:56:51	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY line_item (line_item_id,po_id,bib_id,line_item_type,line_item_number,piece_identifier,unit_price,line_price,print_std_num,quantity,prepay_amount,rush,claim_interval,cancel_interval,donor,requestor,vendor_title_num,vendor_ref_qual,vendor_ref_num,create_date,create_opid,update_date,update_opid,edi_ref,standard_num) FROM STDIN;
75438	73349	4507	3	1	\N	0	0	\N	1	0	\N	0	0	\N	\N	\N	\N	\N	2004-03-30 00:00:00	SYSTEM	2021-06-05 14:22:58	akohler	0	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY invoice (invoice_id,vendor_id,account_id,invoice_number,normal_invoice_number,invoice_status,invoice_status_date,invoice_date,voucher_number,currency_code,conversion_rate,invoice_total,bill_location,invoice_quantity,line_item_count,line_item_subtotal,adjustments_subtotal,total,invoice_create_date,create_opid,create_location_id,invoice_update_date,update_opid,update_location_id,edi_ref,expend_date,check_number,normal_check_number) FROM STDIN;
132867	2373	0	SPECIALID7874386	SPECIALID7874386	1	2015-07-15 11:49:50	2015-05-20 00:00:00	132867	GBP	64510	10846	202	1	1	9450	1396	10846	2015-07-08 10:34:23	jmking	202	2015-07-20 15:34:03	abaxley	202	0	\N	\N	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY invoice_line_item (inv_line_item_id,invoice_id,line_item_id,unit_price,line_price,quantity,prepay_amount,piece_identifier,create_date,create_opid,update_date,update_opid,edi_ref) FROM STDIN;
805898	132867	75438	9450	9450	1	0	TM v.13A	2015-07-08 10:35:12	jmking	2015-07-08 10:35:21	jmking	0
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY purchase_order (po_id,vendor_id,account_id,po_type,po_number,normal_po_number,order_location,ship_location,bill_location,currency_code,conversion_rate,po_status,po_status_date,po_create_date,create_opid,po_update_date,update_opid,create_location_id,update_location_id,ship_via,not_needed_after,rush,claim_interval,cancel_interval,line_item_count,line_item_subtotal,adjustments_subtotal,total,edi_ref,po_approve_date,approve_opid,approve_location_id,prepay_conversion_rate) FROM STDIN;
522069	2264	0	1	MUS522069	MUS522069	292	575	575	EUR	83005	4	2021-05-06 16:26:16	2021-05-06 16:24:52	hlim	2021-05-06 16:26:07	hlim	292	292	\N	\N	0	0	0	1	4400	0	4400	0	2021-05-06 16:26:04	hlim	292	0
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY line_item (line_item_id,po_id,bib_id,line_item_type,line_item_number,piece_identifier,unit_price,line_price,print_std_num,quantity,prepay_amount,rush,claim_interval,cancel_interval,donor,requestor,vendor_title_num,vendor_ref_qual,vendor_ref_num,create_date,create_opid,update_date,update_opid,edi_ref,standard_num) FROM STDIN;
1087047	522069	9467582	0	1	\N	4400	4400	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	2021-05-06 16:25:16	hlim	2021-05-06 16:25:57	hlim	\N	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY line_item_copy_status (line_item_id,item_id,location_id,copy_id,mfhd_id,line_item_status,invoice_item_status,status_date,receive_operator) FROM STDIN;
1087047	0	288	1185415	12564236	1	6	2021-05-06 16:26:16	hlim
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY vendor_types (vendor_type,vendor_type_desc) FROM STDIN;
AG	Agent
BK	Bookstore
OT	Other
PU	Publisher
SO	Society
VE	Vendor
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY vendor (vendor_id,vendor_type,normal_vendor_type,vendor_code,normal_vendor_code,vendor_name,normal_vendor_name,federal_tax_id,institution_id,default_currency,claim_interval,claim_count,cancel_interval,ship_via,create_date,create_opid,update_date,update_opid) FROM STDIN;
3764	VE	VE	LQZ	LQZ	Library of Congress Cataloging Distribution Service	LIBRARY OF CONGRESS CATALOGING DISTRIBUTION SERVICE	\N	006039003	\N	0	0	0	\N	2004-06-04 11:33:09	CONVERSION	2021-05-21 11:14:52	rrivero
9999	VE	VE	LQZ	LQZ	DUP Library of Congress Cataloging Distribution Service	LIBRARY OF CONGRESS CATALOGING DISTRIBUTION SERVICE	\N	006039003	\N	0	0	0	\N	2004-06-04 11:33:09	CONVERSION	2021-05-21 11:14:52	rrivero
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY vendor_account (account_id,vendor_id,account_number,account_name,default_po_type,deposit,default_discount,account_status,status_date) FROM STDIN;
1	3764	552406-010	YRL Serials	5	\N	0	0	2004-07-15 13:47:24
2	3764	552406-015	YRL Fake Monos	5	\N	0	0	2004-07-15 13:47:24
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY line_item_type (line_item_type,line_item_type_desc) FROM STDIN;
0	Single-part
1	Subscription
2	Membership
3	Standing Order
4	Blanket Order
5	Multi-part
6	Approval
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY line_item_funds (copy_id,split_fund_seq,ledger_id,fund_id,percentage,prepay_percentage,amount,prepay,allocation_method) FROM STDIN;
1159093	1	326	3777	100000000	100000000	0	0	P
1159091	1	326	3777	100000000	100000000	0	0	P
1159094	1	326	3777	100000000	100000000	0	0	P
128592	1	355	6758	100000000	0	0	0	P
1185415	1	336	4717	100000000	100000000	4400	0	P
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY bib_title (bib_id,title) FROM STDIN;
9411434	Edo hanpon shūyō /
4507	The complete works of Voltaire /
9467582	Brandnä va /
9411431	Kokatsujiban shūhō /
9411435	Ukiyo-zōshi shūhō /
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;

COPY bib_record (bib_id,bib_record) FROM STDIN;
9467582	01169ccm a2200325Mi 4500001000800000005001700008008004100025024004300066024004600109028003700155035002400192035002200216035002100238040002500259049000900284072001200293100003000305245003700335246007700372250001100449264004800460300003700508336003500545337002800580338002700608500002100635500013300656938004200789994001200831946758220210507051923.0210123s2019    sw uua         n    und d2 aM070134569qFull scoreqspiral binding2 a9790070134569qFull scoreqspiral binding30aGE 13456bGehrmans Musikförlag  a(OCoLC)on1232447040  a(OCoLC)1232447040  aucoclc1232447040  aOHXbengcOHXdOCLCO  aCLUM 7aM2lcco1 aSamuelsson, Marie,d1956-10aBrandnäva /cMarie Samuelsson.31aThe crane's beak:double concerto for guitar, violin and orchestra : 2019  aScore. 1aStockholm :bGehrmans Musikförlag,c2019.  a1 full score (41 pages) ;c42 cm  anotated musicbntm2rdacontent  aunmediatedbn2rdamedia  avolumebnc2rdacarrier  aDuration: 20:00.  aPremiered by Catharina Chen (violin), Jakob Kellermann (guitar) and the Gävle Symfoniorkester, conducted by Christian Karlsen.  aOtto HarrassowitzbHARRnhar205022685  aC0bCLU
4507	21273cam a2204237 i 4500001000500000005001700005008004100022010001700063020002700080020002400107020002700131020002400158020002700182020002400209020002700233020002400260020002700284020002400311020002600335020002300361020002600384020002300410020002600433020002300459020002600482020002300508020002700531020002400558020002800582020002500610020002800635020002500663020002700688020002400715020002800739020002500767020002800792020002500820020002800845020002500873020002800898020002500926020002700951020002400978020002701002020002401029020002701053020002401080020002701104020002401131020002701155020002401182020002801206020002501234020002801259020002501287020002801312020002501340020002701365020002401392020002701416020002401443020002701467020002401494020002701518020002401545020002701569020002401596020002801620020002501648020002801673020002501701020002801726020002501754020002601779020002301805020002801828020002501856020002801881020002501909020002801934020002501962020002801987020002502015020002802040020002502068020002802093020002502121020002802146020002502174020002802199020002502227020002802252020002502280020002702305020002402332020002702356020002402383020002702407020002402434020002702458020002402485020002702509020002402536020002702560020002402587020002702611020002402638020002702662020002402689020002702713020002402740020002802764020002502792020002802817020002502845020002702870020002402897020002702921020002402948020002702972020002502999020002803024020002503052020002803077020002503105020002803130020002503158020003703183020003403220020002703254020002403281020002703305020002403332020002703356020002403383020002703407020002403434020002803458020002503486020002803511020002503539020002803564020002503592020002803617020002503645020002503670020002803695020002503723020002803748020002503776020002703801020002403828020002703852020002403879020002803903020002503931020002803956020002503984020002804009020002504037020002804062020002504090020002804115020002504143020002804168020002504196020002704221020002404248020002804272020002504300020002804325020002504353020002704378020002404405020002804429020002504457020002804482020002504510020002804535020002504563020002704588020002404615020002704639020002404666020002704690020002404717020002804741020002504769020002804794020002504822020002804847020002504875020002804900020002504928020002804953020002504981020002705006020002405033020002705057020002405084020002805108020002505136020002705161020002405188020002805212020002505240020002805265020002505293020002805318020002505346020002805371020002505399020003405424020003105458020003405489020003105523020002805554020002505582020002805607020002505635020003105660020002805691020002705719020002405746020002705770020002405797020002705821020002405848020002705872020002405899020002705923020002405950020002705974020002406001020002806025020002506053020002906078020002606107020002906133020002606162020002806188020002506216020002806241020002506269020004106294020003806335020002906373020002606402020002906428020002606457020002806483020002506511035014306536035001606679035001606695035000906711040052906720041001307249049000907262050001707271050001707288082001407305100003507319240001707354245008107371246003607452260009907488300002107587336002607608337002807634338002707662546005307689500015407742500009307896500067907989504005308668505544908721600003514170700004614205700004514251700003014296700003414326700003014360700003114390700003214421710003414453776019214487910011614679948004314795949000914838935003514847948003314882948002914915948003214944948003214976948003515008948003215043948003515075948003215110948003215142948003215174948003215206948003515238948003515273948003215308948003515340948003515375948003215410948003215442948003215474948003215506948003215538948003215570948003515602948003215637948003515669948003215704948003215736948003515768948003215803948003215835948003215867948003215899948003215931948003215963948003215995948003216027948003216059948003216091948003216123948003216155948003216187948003216219948003216251948003216283948003216315948003216347948003216379948003216411948003516443948003316478948004316511948004616554948004316600948004316643948004616686948004616732948004316778948004316821948003616864948003616900948003316936948003316969948003317002450720210422143505.0690715m19689999sz       b    001 0deng    a   78387674   a9780729407458q(v. 1A)  a0729407454q(v. 1A)  a9780729407748q(v. 1B)  a0729407748q(v. 1B)  a9780729407908q(v. 3A)  a072940790Xq(v. 3A)  a9780729404747q(v. 3B)  a0729404749q(v. 3B)  a9780729408332q(v. 3C)  a0729408337q(v. 3C)  a9780729405072q(v. 4)  a0729405079q(v. 4)  a9780729405676q(v. 5)  a0729405672q(v. 5)  a9780729403597q(v. 8)  a0729403599q(v. 8)  a9780729406468q(v. 9)  a0729406466q(v. 9)  a9780729403252q(v. 10)  a0729403254q(v. 10)  a9780729411462q(v. 11A)  a072941146Xq(v. 11A)  a9780729412223q(v. 11B)  a0729412229q(v. 11B)  a9780729411479q(v. 12)  a0729411478q(v. 12)  a9780729409650q(v. 13A)  a0729409651q(v. 13A)  a9780729411561q(v. 13B)  a0729411567q(v. 13B)  a9780729411578q(v. 13C)  a0729411575q(v. 13C)  a9780729411554q(v. 13D)  a0729411559q(v. 13D)  a9780729403603q(v. 14)  a0729403602q(v. 14)  a9780729403740q(v. 15)  a0729403742q(v. 15)  a9780729407946q(v. 16)  a0729407942q(v. 16)  a9780729404211q(v. 17)  a0729404218q(v. 17)  a9780729405089q(v. 19)  a0729405087q(v. 19)  a9780729407533q(v. 20A)  a0729407535q(v. 20A)  a9780729407540q(v. 20B)  a0729407543q(v. 20B)  a9780729411516q(v. 20C)  a0729411516q(v. 20C)  a9780729409797q(v. 21)  a0729409791q(v. 21)  a9780729408745q(v. 22)  a0729408744q(v. 22)  a9780729409469q(v. 23)  a0729409465q(v. 23)  a9780729409742q(v. 24)  a0729409740q(v. 24)  a9780729409759q(v. 25)  a0729409759q(v. 25)  a9780729409766q(v. 26A)  a0729409767q(v. 26A)  a9780729409773q(v. 26B)  a0729409775q(v. 26B)  a9780729411455q(v. 26C)  a0729411451q(v. 26C)  a9780729410069q(v.27)  a0729410064q(v.27)  a9780729408714q(v. 28A)  a072940871Xq(v. 28A)  a9780729411370q(v. 29A)  a0729411370q(v. 29A)  a9780729408004q(v. 30A)  a0729408000q(v. 30A)  a9780729408141q(v. 30B)  a0729408140q(v. 30B)  a9780729408288q(v. 30C)  a0729408280q(v. 30C)  a9780729404266q(v. 31A)  a0729404269q(v. 31A)  a9780729404273q(v. 31B)  a0729404277q(v. 31B)  a9780729408424q(v. 32A)  a0729408426q(v. 32A)  a9780729409049q(v. 32C)  a072940904Xq(v. 32C)  a9780729403382q(v. 33)  a0729403386q(v. 33)  a9780729411363q(v. 34)  a0729411362q(v. 34)  a9780729403764q(v. 35)  a0729403769q(v. 35)  a9780729403771q(v. 36)  a0729403777q(v. 36)  a9780729408547q(v. 38)  a072940921Xq(v. 37)  a9780729409216q(v. 37)  a072940854Xq(v. 38)  a9780729409056q(v. 39)  a0729409058q(v. 39)  a9780729409223q(v. 40)  a0729409228q(v. 40)  a9780729409230q(v. 41)  a0729409236q(v. 41)  a9780729409247q(v. 42A)  a0729409244q(v. 42A)  a9780729410410q(v. 42B)  a0729410412q(v. 42B)  a9780729409254q(v. 43)  a0729409252q(v. 43)  a9780729410250q(v.44A)  a0729410250q(v.44A)  a9780729412230q(v.44B)  a0729412237q(v. 44B)  a9780729409421q(v. 45A)  a0729409422q(v. 45A)  a9780729409452q(v. 45B)  a0729409457q(v. 45B)  a9780729412247q(v. 44C)  a0729412245q(v. 44C)  a9780729405683q(set ;qv. 46-47)  a0729405680q(set ;qv. 46-47)  a9780729407175q(v. 46)  a0729407179q(v. 46)  a9780729407182q(v. 47)  a0729407187q(v. 47)  a9780729401180q(v. 48)  a0729401189q(v. 48)  a9780729403344q(v. 50)  a0729403343q(v. 50)  a9780729410717q(v. 51A)  a0729410714q(v. 51A)  a9780729410212q(v. 51B)  a0729410218q(v. 51B)  a9780729407298q(v. 56A)  a0729407292q(v. 56A)  a9780729406444q(v. 56B)  a072940644Xq(v. 56B)  z0729407446q(v. 56C)  a9780729410595q(v. 57A)  a0729410595q(v. 57A)  a9780729411400q(v. 57B)  a0729411400q(v. 57B)  a9780729411417q(v. 58)  a0729411419q(v. 58)  a9780802016072q(v. 59)  a0802016073q(v. 59)  a9780729410601q(v. 60A)  a0729410609q(v. 60A)  a9780729411806q(v. 60B)  a072941180Xq(v. 60B)  a9780729410724q(v. 60C)  a0729410722q(v. 60C)  a9780729412193q(v. 60D)  a0729412199q(v. 60D)  a9780729409896q(v. 61A)  a0729409899q(v. 61A)  a9780729410076q(v. 61B)  a0729410072q(v. 61B)  a9780729403481q(v. 62)  a0729403483q(v. 62)  a9780729403610q(v. 63A)  a0729403610q(v. 63A)  a9780729408240q(v. 63C)  a0729408248q(v. 63C)  a9780729403122q(v. 64)  a0729403122q(v. 64)  a9780729409988q(v. 65A)  a0729409988q(v. 65A)  a9780729411523q(v. 65B)  a0729411524q(v. 65B)  a9780729412001q(v. 65C)  a0729412008q(v. 65C)  a9780729404761q(v. 66)  a0729404765q(v. 66)  a9780729408233q(v. 68)  a072940823Xq(v. 68)  a9780729404754q(v. 69)  a0729404757q(v. 69)  a9780729410618q(v. 70A)  a0729410617q(v. 70A)  a9780729411813q(v. 70B)  a0729411818q(v. 70B)  a9780729408639q(v. 71A)  a0729408639q(v. 71A)  a9780729408257q(v. 71B)  a0729408256q(v. 71B)  a9780729407991q(v. 71C)  a0729407993q(v. 71C)  a9780729409667q(v. 72)  a072940966Xq(v. 72)  a9780729408134q(v. 73)  a0729408132q(v. 73)  a9780729407199q(v. 74A)  a0729407195q(v. 74A)  a9780729410199q(v. 76)  a0729410196q(v. 76)  a9780729410588q(v. 77A)  a0729410587q(v. 77A)  a9780729411332q(v. 77B)  a0729411338q(v. 77B)  a9780729410052q(v. 78B)  a0729410056q(v. 78B)  a9780729412216q(v. 78C)  a0729412210q(v. 78C)  a9780729410564q(v. 79A pt. 1)  a0729410560q(v. 79A pt. 1)  a9780729410571q(v. 79A pt. 2)  a0729410579q(v. 79A pt. 2)  a9780729410205q(v. 79B)  a072941020Xq(v. 79B)  a9780729409315q(v. 80A)  a0729409317q(v. 80A)  a9780729402248q(v.81-v.82)  a072940224Xq(v.81-v.82)  a9780729411356q(v. 83)  a0729411354q(v. 83)  a9780802015983q(v. 85)  a0802015980q(v. 85)  a9780802015990q(v. 86)  a0802015999q(v. 86)  a9780802016003q(v. 87)  a0802016006q(v. 87)  a9780802016416q(v. 88)  a0802016413q(v. 88)  a9780802016423q(v. 89)  a0802016421q(v. 89)  a9780729409391q(v. 139)  a0729409392q(v. 139)  a9780729410502q(v. 140A)  a0729410501q(v. 140A)  a9780729410519q(v. 140B)  a072941051Xq(v. 140B)  a9780729407779q(v. 141)  a0729407772q(v. 141)  a9780729409674q(v. 143)  a0729409678q(v. 143)  a9780729408899q(set ;qv. 144A-144B)  a0729408892q(set ;qv. 144A-144B)  a9780729412186q(v. 144A)  a0729412180q(v. 144A)  a9780729412209q(v. 144B)  a0729412202q(v. 144B)  a9780729408905q(v. 145)  a0729408906q(v. 145)  a(OCoLC)00019501z(OCoLC)02007664z(OCoLC)02658422z(OCoLC)63056220z(OCoLC)222667767z(OCoLC)228266590z(OCoLC)705272996z(OCoLC)881845408  aucoclc19501  907-AMR-1960  a4507  aDLCbengcDLCdBTCTAdSTFdUTOdI8HdYDXCPdNTEdCDXdOSUdCWIdCUSdUMRdGZMdAUDdCUDdNYPdWAUdUBFdNDDdPBUdUNBCAdTXAdOCLCFdPBUdUNBCAdCODdOCLCQdOCLCOdCUSdLGGdPBUdLGGdUNBCAdIULdLGGdBOSdLGGdOCLCOdHDCdOCLCQdLGGdCODdUNBCAdLGGdCUSdHDCdLGGdCUYdLGGdWAUdCUYdOCLCQdWAUdCODdLGGdUNBCAdLGGdCUVdWAUdAUMdWAUdLGGdWAUdLGGdCODdIULdGOCdIULdWAUdLGGdPBUdAUMdUNBCAdKSUdLGGdEEMdIULdWAUdAUMdCUVdUNBCAdLGGdPSCdGUAdCUVdOCLCAdNLCdLGGdOCLCQdTYCdOCLCQdALMdLGGdWAUdLGGdCLU0 aengafre  aVBIB00aPQ2070b1968 4aPQ2075b196800a848/.5/091 aVoltaire,d1694-1778,eauthor.10aWorks.f196814aThe complete works of Voltaire /c[edited by Theodore Besterman and others].15aŒuvres complètes de Voltaire  aGeneva :bInstitut et Musée Voltaire ;aToronto :bUniversity of Toronto Press,c1968-<2019>  avolumes ;c23 cm  atextbtxt2rdacontent  aunmediatedbn2rdamedia  avolumebnc2rdacarrier  aIn French; critical matter in English or French.  aEditors : Theodore Besterman (1904-1976), W.H. Barber (1974-1993), Ulla Kölving (1989-1998), Haydn Mason (1998-2001), Nicholas Cronk (2000-<2019>).  aVolumes have both separate English and French title pages or only the French title page.  aPublication imprint varies: Vols. <2, 7, 90-99>: Geneva : Institute et Musee Voltaire; Vols. <59, 81-82, 85-89>: Geneva : Institute et Musee Voltaire ; Toronto : University of Toronto Press; Vols. <1A, 1B, 3A-C, 4-5, 9, 16, 19, 20A-C, 28A-29A, 30A-C, 32A, 35-36, 46-47, 51A, 56A-C, 58, 63C, 66, 68-69, 70A-B, 71A-B, 73, 74A, 78B-C, 141, 144 A-B>: Oxford : Voltaire Foundation; Vols. <8, 11A, 12, 13A-D, 14, 15, 17, 26C, 27, 31A-B, 33, 34, 44A-C, 48, 50, 58, 60A, 60B, 60D, 62, 63A, 64, 65B, 65C, 80B, 83,133-135>: Oxford : Voltaire Foundation, Taylor Institution; Vols. <53-55, 100-105, 107-121, 123-130>: Banbury, Oxfordshire : Voltaire Foundation, Thorpe Mandeville House.  aIncludes bibliographical references and indexes.0 av. 1. Œuvres de 1707-1722 -- v. 2. La Henriade -- v. 3A. Œuvres de 1723-1728 -- v. 3B. English Essay -- v. 3C. Works 1723-1728 -- v. 4. Histoire de Charles XII -- v. 5. Œuvres de 1728-1730 -- v. 7. La Pucelle -- v. 8. Œuvres de 1731-1732 -- v. 9. Œuvres de 1732-1733 -- v. 10. Adé̂laïde du Guesclin ; Les frères ennemis ; Amélie ou le duc de Foix ; Alamire -- v. 11A. Siècle de Louis XIV (IA) -- v. 11B. Siècle de Louis XIV (IB)-- v. 12. Siècle de Louis XIV (II) -- v. 13B. Siecle de Louis XIV; t. 4. Chapitres 13-24 -- v. 13C. Siecle de Louis XIV; t. 5. Chapitres 25-30 -- v. 13D. Siecle de Louis XIV; t. 6. Chapitres 31-39 -- v. 14. Œuvres de 1734-1735 -- v. 15. Eléments de la philosophie de Newton -- v. 16. Œuvres de 1736 -- v. 17. Œuvres de 1737 -- v. 18. Œuvres de 1738-1740 -- v. 19. Anti-Machiavel -- v. 20A. Œuvres de 1739-1741 -- v. 20 B. Le fanatisme, ou Mahomet le prophète ; De l'Alcoran et de Mahomet -- v. 20C. Micromegas and other texts (1738-1742) -- v. 21. Essai sur les moeurs et l'esprit des nations, t. 1. Introduction générale. Index analytique -- v. 22. Essai sur les mœurs et l'esprit des nations, t. 2 : avant-propos et chapitres 1-37 -- v. 25. Essai sur les moeurs et l'esprit des nations. Tome 5, chapitres 103-129  -- v. 26A. Essai sur les moeurs et l'esprit des nations. Tome 6, chapitres 130-162 -- v. 26B. Essai sur les moeurs et l'esprit des nations. Tome 7, chapitres 163-176 -- v. 26C. Essai sur les moeurs et l'esprit des nations. Tome 7, chapitres 177-197 -- v. 27. Essai sur les moeurs et l'esprit des nations; t. 9. Textes annexes. Fragments sur l'histoire generale -- v. 28. Œuvres de 1742-1745 -- v. 29A. Precis du siècle de Louis XV. I. Introduction, chapters 1-16 -- v. 30A-C. Œuvres de 1746-1748 -- v. 31. Œuvres de 1731 -- v. 32A-B. Œuvres de 1750-1752 -- v. 33. Œuvres alphabétiques -- v. 34. Œuvres alphabétiques (II), ajouts posthumes -- v. 35-36. Dictionnaire philosophique -- v. 37-39. Questions sur l'Encyclopédie, par des amateurs -- v. 40. Questions sur l'Encyclopédie, par des amateurs. IV, César - Égalité  -- v. 42B. Questions sur l'Encyclopedie, par des amateurs. VII, Langues - Prieres  -- v. 44A. Annales de l'Empire depuis Charlemagne, t. 1. Introduction, textes préliminaires, chapitres 1-17 -- v. 44B. Annales de l'Empire depuis Charlemagne, t. 2. Chapitres 18-39 -- v. 44C. Annales de l'Empire depuis Charlemagne, t. 3. Chapitres 40-48 -- v. 45A. Writings of 1753-1757 -- v. 45B. Œuvres de 1753-1757, II, Mélanges de 1756 -- v. 45C. Paméla ; Mémoires pour servir à la vie de Monsieur de Voltaire, écrits par lui-même -- v. 46-47. Histoire de l'empire de Russie sous Pierre le Grand -- v. 48. Candide, ou l'optimisme -- v. 49A. Writings of 1758-1759 -- v. 49B. Sermon des cinquante 1758-1760 -- v. 50. Œuvres de 1760 -- v. 51B. Writings of 1760-1761 (II) -- v. 53-55. Commentaires sur Corneille -- v. 56. Œuvres de 1762 -- v. 57A. Writings of 1763-1764 -- v. 57B. Contes de Guillaume Vade -- v. 58. Œuvres de 1764 -- v. 59. La philosophie de l'histoire -- v. 60A. Nouveaux Mélanges (1765) -- v. 60B. Œuvres de 1764-1766 -- v. 60C. Writings of 1766 (I) -- v. 60D. Collection des lettres sur les miracles. Écrites a Genève, et a Neufchatel -- v. 61A. Oeuvres de 1766 (II) -- v. 62. Œuvres de 1766-1767 -- v. 63 A-B. Œuvres de 1767 -- v. 63C. L'ingénu -- v. 64. La défense de mon oncle ; A Warburton -- v. 65A. Oeuvres de 1767-1768 -- v. 65B. Les singularités de la nature -- v. 65C -67. Œuvres de 1768 -- v. 68. Histoire du parlement de Paris -- v. 69. Œuvres de 1769 -- v. 70A. Writings of 1769 (IIA) -- v. 70B. Writings of 1769 (IIB). Memoire sur Versoix [1770] -- v. 71. Œuvres de  1769-1770 -- v. 71C. Oeuvres de 1769-1770 (III) -- v. 72. Oeuvres de 1770-1771 -- v. 74. Œuvres de 1772 -- v. 75A. Œuvres 1773 -- v. 75B. Fragments sur l'Inde et sur le général Lalli -- v. 77A. Oevres de 1775 -- v. 78B-C. Commentaire historique sur les oeuvres de l'auteur de La Henriade, etc. Avec les pièces originales et les preuves -- v. 79A: pt. 1. La Bible enfin expliquee par plusieurs aumoniers de S. M. L. R. D. P. (I). Texte -- v. 79A: pt. 2. La Bible enfin expliquee par plusieurs aumoniers de S. M. L. R. D. P. (II). Annotations -- v. 79B. Religious works of 1776 -- v. 80A. Eloge et Pensées de Pascal, édition établie par Condorcet, annotée par Voltaire -- v. 80B-C. Œuvres de 1777-1778 -- v. 81-82 Notebooks -- v. 85-135. Correspondence -- v. 136. Corpus des notes marginales de Voltaire. 1. A-Buzonnière -- v. 137A-137B. Corpus des notes marginales de Voltaire (2A, Caesar - Challes ; 2B, Chalons - Cyrillus) -- v. 138. Corpus des notes marginales de Voltaire. (3, Dale - Frisi) -- v. 139. Corpus des notes marginales de Voltaire. (4, Gachet d'Artigny - Koran) -- v. 140A-B. Corpus des notes marginales de Voltaire. (5, La Barre - Muyart de Vouglans) -- v. 141. Corpus des notes marginales de Voltaire. (6, Nadal - Plato) -- v. 142. Corpus des notes marginales de Voltaire. (7, Plautus - Rogers) -- v. 143. Corpus des notes marginales de Voltaire (8, Rollin - Sommier) -- v. 144A. Corpus des notes marginales de Voltaire (9A. Spallanzani - Zeno) -- v. 144B. Corpus des notes marginales de Voltaire (9B. Annexes notes éditoriales) -- v. 145. Notes et  écrits marginaux conservés hors de la Bibliothèque nationale de Russie. Complement au Corpus des notes marginales.10aCorneille, Pierre,d1606-1684.1 aBesterman, Theodore,d1904-1976,eeditor.1 aBarber, W. H.q(William Henry),eeditor.1 aKölving, Ulla,eeditor.1 aMason, Haydn Trevor,eeditor.1 aCronk, Nicholas,eeditor.1 aVenturino, Diego,eeditor.1 aElaguina, Natalia,deditor.2 aInstitut et musée Voltaire.08iOnline version:aVoltaire, 1694-1778.sWorks. 1968.tComplete works of Voltaire.dGeneva, Institut et Musée Voltaire; Toronto, University of Toronto Press, 1968-<1977>w(OCoLC)566100791  ajga 180829ajga 180611ajga 180409ajga 171214anla 070705ranla 050816racmh 050222racpk 040622rarcp 6aMARS  acmcbjgac20180611d1revgavkdiscteam  a4507  aMC3198295bTC0103803cACO-3660  acmcbcmhc20071002d1revgav  acmcbnlac20071115d2rev  acmcbsmc20080520d1revgav  acmcbsmc20080602d1revgav  acmcbsmc20080807d1revf2gav  acmcbsmc20081125d1revgav  acmcbsmc20090320d1revf2gac  acmcbsmc20090709d1revgav  acmcbsmc20090806d1revgav  acmcbsmc20090812d1revgav  acmcbsmc20090930d1revgav  acmcbsmc20101130d1revf2gav  acmcbsmc20110105d1revf2gav  acmcbsmc20110207d1revgav  acmcbsmc20110211d1revf4gav  acmcbsmc20110307d1revf2gav  acmcbsmc20110711d1revgav  acmcbsmc20110728d1revgav  acmcbsmc20111117d1revgav  acmcbsmc20111209d1revgav  acmcbsmc20120120d1revgav  acmcbsmc20120531d1revgav  acmcbsmc20120629d1revf2gav  acmcbsmc20120718d1revgav  acmcbsmc20120831d1revf2gav  acmcbsmc20121026d1revgav  acmcbsmc20121219d1revgav  acmcbsmc20130315d1revf2gav  acmcbsmc20130524d1revgav  acmcbsmc20130925d1revgav  acmcbsmc20131028d1revgav  acmcbsmc20140408d1revgav  acmcbsmc20140417d1revgav  acmcbsmc20140505d1revgav  acmcbsmc20140630d1revgav  acmcbsmc20140801d1revgav  acmcbsmc20141022d1revgav  acmcbsmc20141112d1revgav  acmcbsmc20141222d1revgav  acmcbsmc20150114d1revgav  acmcbsmc20150630d1revgav  acmcbsmc20151106d1revgav  acmcbsmc20160104d1revgav  acmcbsmc20160303d1revgav  acmcbsmc20160613d1revgav  acmcbsmc20160708d1revgav  acmcbsmc20160826d1revgav  acmcbsmc20161006d1revgav  acmcbsmc20170403d1revf2gav  acmcbcmhc20170615d1revgav  acmcbdsic20170720d3revgavkdiscteam  acmcbdsic20171109d3revf2gavkdiscteam  acmcbjgac20171214d1revgavkdiscteam  acmcbjgac20180409d2revgavkdiscteam  acmcbjgac20180829d2revf2gavkdiscteam  acmcbdsic20181010d2revf2gavkdiscteam  acmcbdsic20181120d2revgavkdiscteam  acmcbdsic20190211d2revgavkdiscteam  acmcbadkc20190611d2revf2gav  acmcbadkc20190822d2revf2gav  acmcbadkc20190913d2revgav  acmcbadkc20191121d2revgav  acmcbadkc20200122d1revgav
\.

COMMIT;


BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY invoice_line_item_funds (copy_id,inv_line_item_id,split_fund_seq,ledger_id,fund_id,percentage,amount,allocation_method) FROM STDIN;
1159093	1133653	1	326	3781	100000000	291093	P
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY fund (fund_id,ledger_id,parent_fund,fund_name,normal_fund_name,fund_code,normal_fund_code,category,fund_type,begin_date,end_date,institution_fund_id,expend_only,original_allocation,allocation_increase,allocation_decrease,commit_pending,commitments,expend_pending,expenditures,overcommit,overcommit_warn,overcommit_percent,commit_freeze,undercommit_percent,overexpend,overexpend_warn,overexpend_percent,expend_freeze,underexpend_percent,create_date,create_opid,update_date,update_opid) FROM STDIN;
3781	326	3771	Japanese Ser EDW Init	JAPANESE SER EDW INIT	L3DEEAJA-2	L3DEEAJA 2	2	1	\N	\N	4 603800 LM 19900 05 6300 JAPAN	N	0	0	0	0	0	0	2449316	N	0	0	\N	0	N	0	0	\N	0	2020-07-01 09:12:50	<R>	2020-07-01 09:12:50	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY price_adjustment (object_type,object_id,sequence,reason_id,method,adjust_amount,payment_id) FROM STDIN;
C	182740	1	15	1	27654	975646
C	182740	2	12	1	116146	975647
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY fund_payment (payment_id,split_fund_seq,ledger_id,fund_id,percentage,amount) FROM STDIN;
975646	1	326	5999	100	27654
975647	1	327	8648	100	116146
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY ledger (ledger_id,fiscal_year_id,acq_policy_id,ledger_name,normal_ledger_name,overcommit,overcommit_warn,overcommit_percent,commit_freeze,undercommit_percent,overexpend,overexpend_warn,overexpend_percent,expend_freeze,underexpend_percent,create_date,create_opid,update_date,update_opid,rule_id,new_ledger_name,normal_new_ledger_name,new_ledger_id) FROM STDIN;
327	17	1	AUL COLLECTIONS 20-21	AUL COLLECTIONS 20 21	N	0	0	\N	0	N	0	0	\N	0	2020-07-01 09:12:50	<R>	2020-07-01 09:12:50	\N	32	AUL COLLECTIONS 21-22	AUL COLLECTIONS 21 22	345
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY fund (fund_id,ledger_id,parent_fund,fund_name,normal_fund_name,fund_code,normal_fund_code,category,fund_type,begin_date,end_date,institution_fund_id,expend_only,original_allocation,allocation_increase,allocation_decrease,commit_pending,commitments,expend_pending,expenditures,overcommit,overcommit_warn,overcommit_percent,commit_freeze,undercommit_percent,overexpend,overexpend_warn,overexpend_percent,expend_freeze,underexpend_percent,create_date,create_opid,update_date,update_opid) FROM STDIN;
5999	326	3771	Japanese Serial Tax	JAPANESE SERIAL TAX	L3SPEATXJ9	L3SPEATXJ9	2	1	\N	\N	4 603800 LM 19900 05 6300 JAPAN	N	0	0	0	0	0	0	71614	N	0	0	\N	0	N	0	0	\N	0	2020-07-01 09:12:50	<R>	2020-07-01 09:12:50	\N
8648	327	5520	AUL Disc 19933 Tax Mono	AUL DISC 19933 TAX MONO	L3MELAABT9	L3MELAABT9	2	1	\N	\N	4 606300 LM 19933 05 9200	N	0	0	0	0	0	0	116146	N	0	0	\N	0	N	0	0	\N	0	2020-11-13 14:10:13	abaxley	2020-11-13 14:14:13	abaxley
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY adjust_reason (reason_id,reason_text,charge_or_credit,reason_edi_code,vendor_id) FROM STDIN;
12	TM mono sales tax code	+	\N	0
15	TS serial sales tax code	+	\N	0
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY line_item (line_item_id,po_id,bib_id,line_item_type,line_item_number,piece_identifier,unit_price,line_price,print_std_num,quantity,prepay_amount,rush,claim_interval,cancel_interval,donor,requestor,vendor_title_num,vendor_ref_qual,vendor_ref_num,create_date,create_opid,update_date,update_opid,edi_ref,standard_num) FROM STDIN;
1060974	518017	9411431	0	1	\N	0	0	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	2020-12-04 10:46:42	jtanaka	2021-04-12 09:40:23	jtanaka	\N	\N
1060977	518017	9411435	0	4	\N	0	0	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	2020-12-04 10:51:19	jtanaka	2021-04-12 09:40:49	jtanaka	\N	\N
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY invoice_line_item_funds (copy_id,inv_line_item_id,split_fund_seq,ledger_id,fund_id,percentage,amount,allocation_method) FROM STDIN;
1159091	1133652	1	327	7133	100000000	853872	P
1159094	1133654	1	327	7133	100000000	368717	P
\.

COMMIT;

BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY fund (fund_id,ledger_id,parent_fund,fund_name,normal_fund_name,fund_code,normal_fund_code,category,fund_type,begin_date,end_date,institution_fund_id,expend_only,original_allocation,allocation_increase,allocation_decrease,commit_pending,commitments,expend_pending,expenditures,overcommit,overcommit_warn,overcommit_percent,commit_freeze,undercommit_percent,overexpend,overexpend_warn,overexpend_percent,expend_freeze,underexpend_percent,create_date,create_opid,update_date,update_opid) FROM STDIN;
7133	327	5520	AUL Discret EDW 19933	AUL DISCRET EDW 19933	L3DELAAB21	L3DELAAB21	2	1	\N	\N	4 606300 LM 19933 05 9200 	N	0	0	0	0	0	0	9494786	N	0	0	\N	0	N	0	0	\N	0	2020-07-01 09:12:50	<R>	2020-11-13 14:21:24	abaxley
\.

COMMIT;
