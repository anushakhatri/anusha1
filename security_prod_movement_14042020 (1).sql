/*DDL for Security*/
/*1. al_hrdl.user_access */
CREATE TABLE al_hrdl.user_access
(
  emp_skey bigint NOT NULL,
  emp_id character varying(50) NOT NULL,
  ge_sso_id bigint NULL,
  org_role character varying(255) NOT NULL,
  rpt_field text NOT NULL,
  sup_org_skey text,
  sup_org_id text,
  sup_org_desc text,
  loc_city text,
  loc_cntry text,
  loc_region text,
  org_cd text,
  org_desc text,
  co_ref_id text,
  co_nm text,
  pay_group_ref_id text,
  pay_group text,
  etl_insert_dt timestamp without time zone,
  etl_update_dt timestamp without time zone,
  etl_insert_by character varying(30),
  etl_updated_by character varying(30),
  CONSTRAINT user_access_pkey PRIMARY KEY (emp_skey, org_role)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE al_hrdl.user_access OWNER TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE al_hrdl.user_access TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE al_hrdl.user_access TO bhdlhr_og_hrdl_updater;

CREATE INDEX idx_user_access01 ON al_hrdl.user_access USING btree (emp_id COLLATE pg_catalog."default");
CREATE INDEX idx_user_access02 ON al_hrdl.user_access USING btree (ge_sso_id);

/*1.read_hrdl view for al_hrdl.user_access */
create or replace view read_hrdl.user_access as select * from al_hrdl.user_access;
ALTER TABLE read_hrdl.user_access OWNER TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE read_hrdl.user_access TO bhdlhr_read_vw_hrdl_looker;
/*----------------------------------------------------------------------*/
/*2. al_hrdl.user_access_hist*/
create   TABLE al_hrdl.user_access_hist
(
  emp_skey bigint NOT NULL,
  emp_id character varying(50) NOT NULL,
  ge_sso_id bigint NULL,
  org_role character varying(255) NOT NULL,
  rpt_field text NOT NULL,
  sup_org_skey text,
  sup_org_id text,
  sup_org_desc text,
  loc_city text,
  loc_cntry text,
  loc_region text,
  org_cd text,
  org_desc text,
  co_ref_id text,
  co_nm text,
  pay_group_ref_id text,
  pay_group text,
  etl_insert_dt timestamp without time zone,
  etl_insert_by character varying(30) 
)
WITH (
  OIDS=FALSE
);

ALTER TABLE al_hrdl.user_access_hist OWNER TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE al_hrdl.user_access_hist TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE al_hrdl.user_access_hist TO bhdlhr_og_hrdl_updater;

/*2. read_hrdl view for al_hrdl.user_access_hist*/
create or replace view read_hrdl.user_access_hist as select * from al_hrdl.user_access_hist;
ALTER TABLE read_hrdl.user_access_hist OWNER TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE read_hrdl.user_access_hist TO bhdlhr_read_vw_hrdl_looker;
/*----------------------------------------------------------------------*/

/*3. al_hrdl.wd_hrdl_col_mapping*/

CREATE TABLE al_hrdl.wd_hrdl_col_mapping
(
  security_group character varying(255) NOT NULL,
  asgnable_role character varying(255) NOT NULL,
  domain_granted character varying(255) NOT NULL,
  functional_area character varying(255) NOT NULL,
  rpt_field character varying(255) NOT NULL,
  hrdl_field character varying(255) NOT NULL,
  inactive boolean NOT NULL,
  etl_insert_dt timestamp without time zone,
  etl_update_dt timestamp without time zone,
  etl_insert_by character varying(30),
  etl_updated_by character varying(30),
  CONSTRAINT wd_hrdl_col_mapping_pkey PRIMARY KEY (security_group, asgnable_role, domain_granted, functional_area, rpt_field, hrdl_field)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE al_hrdl.wd_hrdl_col_mapping OWNER TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE al_hrdl.wd_hrdl_col_mapping TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE al_hrdl.wd_hrdl_col_mapping TO bhdlhr_cons_hrdl_looker;
GRANT ALL ON TABLE al_hrdl.wd_hrdl_col_mapping TO bhdlhr_cons_hrdl_updater;

CREATE INDEX idx_wd_hrdl_col_mapping01 ON al_hrdl.wd_hrdl_col_mapping USING btree (inactive);

/*3.read_hrdl view for al_hrdl.wd_hrdl_col_mapping*/
create or replace view read_hrdl.wd_hrdl_col_mapping as select * from al_hrdl.wd_hrdl_col_mapping;
ALTER TABLE read_hrdl.wd_hrdl_col_mapping OWNER TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE read_hrdl.wd_hrdl_col_mapping TO bhdlhr_read_vw_hrdl_looker;


/*----------------------------------------------------------------------*/

/*4. og_hrdl.wd_hrdl_col_map*/
CREATE TABLE og_hrdl.wd_hrdl_col_map
( security_group character varying(255) NOT NULL,
  asgnable_role character varying(255) NOT NULL,
  domain_granted character varying(255) NOT NULL,
  functional_area character varying(255) NOT NULL,
  rpt_field character varying(255) NOT NULL,
  hrdl_field character varying(255) NOT NULL,
  inactive boolean NOT NULL,
  etl_insert_dt timestamp without time zone,
  etl_update_dt timestamp without time zone,
  etl_insert_by character varying(30),
  etl_updated_by character varying(30),
  PRIMARY KEY (security_group, asgnable_role, domain_granted, functional_area, rpt_field, hrdl_field)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE og_hrdl.wd_hrdl_col_map OWNER TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE og_hrdl.wd_hrdl_col_map TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE og_hrdl.wd_hrdl_col_map TO bhdlhr_cons_hrdl_looker;
GRANT ALL ON TABLE og_hrdl.wd_hrdl_col_map TO bhdlhr_cons_hrdl_updater;

/*read_hrdl view for og_hrdl.wd_hrdl_col_map*/
create or replace view read_hrdl.wd_hrdl_col_map as select * from og_hrdl.wd_hrdl_col_map;
ALTER TABLE read_hrdl.wd_hrdl_col_map OWNER TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE read_hrdl.wd_hrdl_col_map TO bhdlhr_read_vw_hrdl_looker;
/*----------------------------------------------------------------------*/
/*5. al_hrdl.user_access_tmp*/
 /*create table al_hrdl.user_access_tmp (emp_id varchar(50), org_role varchar(255) );*/
create table al_hrdl.user_access_tmp (emp_skey bigint, emp_id varchar(50), org_role varchar(255) );  
ALTER TABLE al_hrdl.user_access_tmp OWNER TO svc_hrdl_etl_prod; 
GRANT ALL ON TABLE al_hrdl.user_access_tmp TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE al_hrdl.user_access_tmp TO bhdlhr_og_hrdl_updater;

/* read_hrdl view for al_hrdl.user_access_tmp*/
create or replace view read_hrdl.user_access_tmp as select * from al_hrdl.user_access_tmp;
ALTER TABLE read_hrdl.user_access_tmp OWNER TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE read_hrdl.user_access_tmp TO bhdlhr_read_vw_hrdl_looker;
/*----------------------------------------------------------------------*/

/*6. al_hrdl.wd_hrdl_col_mapping_tmp */
CREATE TABLE al_hrdl.wd_hrdl_col_mapping_tmp
(
  rpt_field character varying(255),
  security_group character varying(255),
  asgnable_role character varying(255),
  domain_granted character varying(255),
  functional_area character varying(255),
  etl_insert_dt timestamp without time zone,
  etl_insert_by character varying(30)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE al_hrdl.wd_hrdl_col_mapping_tmp OWNER TO svc_hrdl_etl_prod; 
GRANT ALL ON TABLE al_hrdl.wd_hrdl_col_mapping_tmp TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE al_hrdl.wd_hrdl_col_mapping_tmp TO bhdlhr_og_hrdl_updater;

/*read_hrdl view for  al_hrdl.wd_hrdl_col_mapping_tmp */
create or replace view read_hrdl.wd_hrdl_col_mapping_tmp as select * from al_hrdl.wd_hrdl_col_mapping_tmp;
ALTER TABLE read_hrdl.wd_hrdl_col_mapping_tmp OWNER TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE read_hrdl.wd_hrdl_col_mapping_tmp TO bhdlhr_read_vw_hrdl_looker;
/*----------------------------------------------------------------------*/

/*flat files insert : */
DELETE  from og_hrdl.flat_files where source_name = 'Security' ; 
insert into og_hrdl.flat_files  
select 'Security', table_name, column_name, ordinal_position, data_type, character_maximum_length, numeric_precision, numeric_scale, null , 'N', 'N'
from information_schema.columns where table_name = 'wd_hrdl_col_map'
and column_name not in ('etl_insert_dt', 'etl_update_dt','etl_insert_by', 'etl_updated_by' )
and table_schema = 'og_hrdl';

/*edl_connection*/
update og_hrdl.edl_connection  set date_append = 'DDMMYYYYHHMMSS'
where system_name = 'Security'; 

/*edl_table*/ 
INSERT INTO og_hrdl.edl_table
(plant_name, system_name, sub_system_name, category, source_schema, source_table_name, source_type, target_schema, target_table_name, target_type, ingestion_tool, ingestion_frequency, update_type, update_col, update_pk, last_update_value, last_update_date, previous_last_update_date, last_update_date_hdfs, previous_last_update_date_hdfs, enabled, load_order, sql_text, flat_file_name, flat_file_separator, flat_file_enclosure, flat_file_header, flat_file_quote, config_params, last_prod2dev_date, date_regexp_mask, date_mask, unix_command_line, ftp_remote_dir, time_correction_hour, multithread_number, multithread_by, flat_file_null_string, status, threshold_value, flat_file_date_append, variance_value, sftp_user)
VALUES('Sourcing', 'Security', null, NULL, 'og_hrdl', NULL, 'File', 'og_hrdl', 'wd_hrdl_col_map', 'Table', 'Talend', 'Daily', 'Full', NULL, NULL, '0', null, NULL, NULL, NULL, 'Y', 1, NULL, 'wd_hrdl_col_map.txt', '|', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Finished', 1, NULL, NULL, NULL);


/*hr_cntl_dep*/
INSERT INTO og_hrdl.hr_cntl_dep
(group_name, group_dep_order, tables_in_parallel, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('Sec_hrdl_wd_map_mirror', 28, 5, 'Security Mirror layer table load', now(), now(), 'svc_hrdl_etl', 'svc_hrdl_etl');

INSERT INTO og_hrdl.hr_cntl_dep
(group_name, group_dep_order, tables_in_parallel, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('Sec_hrdl_wd_map_al', 29, 5, 'Security Analytical layer table load', now(), now(), 'svc_hrdl_etl', 'svc_hrdl_etl');

/*hr_cntl_etl*/
delete from og_hrdl.hr_cntl_etl where group_name = 'Outbound_WD'; 
INSERT INTO og_hrdl.hr_cntl_etl
(appln_name, group_name, table_name, priority, last_refreshed_date, status, source_schema, target_schema, source_table_name, target_table_name, cur_run_id, load_type, active_flag, last_update_date, previous_last_update_date, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_mirror', 'wd_hrdl_col_map', 1, null, 'Finished', 'og_hrdl', 'og_hrdl', 'wd_hrdl_col_map_stg', 'wd_hrdl_col_map', null, 'Full', 'Y', NULL, NULL,now(), NULL, 'svc_hrdl_etl', NULL);

INSERT INTO og_hrdl.hr_cntl_etl
(appln_name, group_name, table_name, priority, last_refreshed_date, status, source_schema, target_schema, source_table_name, target_table_name, cur_run_id, load_type, active_flag, last_update_date, previous_last_update_date, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_al', 'wd_hrdl_col_mapping', 1, null, 'Finished', 'og_hrdl', 'al_hrdl', 'wd_hrdl_col_map', 'wd_hrdl_col_mapping', null, 'Full', 'Y', NULL, NULL,now(), NULL, 'svc_hrdl_etl', NULL);

/*hr_etl_scripts*/
delete from og_hrdl.hr_etl_scripts where group_name = 'Outbound_WD';

INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_mirror', 'wd_hrdl_col_map', 'truncate og_hrdl.wd_hrdl_col_map;', 1, 'Full', 'Y', 'Truncate', '', now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_mirror', 'wd_hrdl_col_map', 'Insert into og_hrdl.wd_hrdl_col_map( security_group, asgnable_role, domain_granted, functional_area, rpt_field, hrdl_field, inactive, etl_insert_dt, etl_update_dt, etl_insert_by, etl_updated_by ) select trim(security_group), trim(asgnable_role), trim( domain_granted ), trim( functional_area ), trim( rpt_field ), trim( hrdl_field ),inactive::boolean,  now(), now(), ''svc_hrdl_etl'', ''svc_hrdl_etl'' from og_hrdl.wd_hrdl_col_map_stg where coalesce( err_flag, ''N'' )<> ''Y'';', 2, 'Full', 'Y', 'Insert', '', now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_mirror', 'wd_hrdl_col_map', 'Analyse   og_hrdl.wd_hrdl_col_map;', 3, 'Full', 'Y', 'Analyze', '', now(), NULL, 'svc_hrdl_etl', NULL);

INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_al', 'wd_hrdl_col_mapping', 'update al_hrdl.wd_hrdl_col_mapping map set hrdl_field=src.hrdl_field, inactive=src.inactive, etl_update_dt = now(), etl_updated_by =  ''svc_hrdl_etl'' from (select security_group, asgnable_role, domain_granted, functional_area, rpt_field, hrdl_field, inactive from og_hrdl.wd_hrdl_col_map) src where  src.security_group= map.security_group and src.asgnable_role=map.asgnable_role and src.domain_granted=map.domain_granted and src.functional_area = map.functional_area and  src.rpt_field=map.rpt_field and src.inactive is not null; ', 1, 'Incremental', 'Y', 'Update', '', now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_al', 'wd_hrdl_col_mapping', 'insert into al_hrdl.wd_hrdl_col_mapping ( security_group, asgnable_role, domain_granted, functional_area, rpt_field, hrdl_field, inactive, etl_insert_dt, etl_update_dt, etl_insert_by, etl_updated_by ) select src.security_group, src.asgnable_role, src.domain_granted, src.functional_area, src.rpt_field, src.hrdl_field, src.inactive, now(), now(), ''svc_hrdl_etl'', ''svc_hrdl_etl''  from og_hrdl.wd_hrdl_col_map src left outer join al_hrdl.wd_hrdl_col_mapping map on  src.security_group= map.security_group and src.asgnable_role=map.asgnable_role and src.domain_granted=map.domain_granted and src.functional_area = map.functional_area and  src.rpt_field=map.rpt_field where  map.rpt_field is NULL and src.inactive is not null;', 2, 'Incremental', 'Y', 'Insert', '', now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_al', 'wd_hrdl_col_mapping', 'analyse al_hrdl.wd_hrdl_col_mapping;', 3, 'Incremental', 'Y', 'Analyse', '', now(), NULL, 'svc_hrdl_etl', NULL);

INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_al', 'wd_hrdl_col_mapping', 'drop table if exists al_hrdl.user_access_tmp1;', 4, 'Incremental', 'Y', 'Drop', '', now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_al', 'wd_hrdl_col_mapping', 'create table al_hrdl.user_access_tmp1 as select distinct dtl.emp_skey::bigint, b.emp_id, dtl.ge_sso_id::bigint, b.org_role, map.hrdl_field  as rpt_field, b.sup_org_skey, b.sup_org_id,b.sup_org_desc, b.loc_cntry, b.loc_city, b.loc_region, b.pay_group_ref_id, b.pay_group, b.co_ref_id, b.co_nm, b.org_cd, b.org_desc from (select a.emp_id, a.org_role, string_agg(a.loc_entry::text,''~'') as loc_cntry , string_agg(a.city_entry::text,''~'') as loc_city, string_agg(a.region_entry::text,''~'') as loc_region, string_agg(a.org_entry::text,''~'') as org, string_agg (split_part (a.org_entry::text, '',~'',1), ''~'' )  as sup_org_skey, string_agg (split_part (a.org_entry::text, '',~'',2), ''~'' )  as sup_org_id, string_agg (split_part (a.org_entry::text, '',~'',3), ''~'' )  as sup_org_desc, string_agg (a.pay_group_ref_id, ''~'' ) as pay_group_ref_id, string_agg (a.pay_group, ''~'') as pay_group, string_agg (a.co_ref_id, ''~'' ) as co_ref_id, string_agg (a.co_nm, ''~'') as co_nm, string_agg (a.org_cd, ''~'' ) as org_cd, string_agg (a.org_desc, ''~'') as org_desc from (select distinct org_role, emp_id, case when org_type = ''Location Hierarchy'' and (split_part (org_id ,''_'',3) = ''COUNTRY'' or  split_part (org_id ,''_'',4) = ''COUNTRY'') then org end as loc_entry, case when org_type = ''Location Hierarchy'' and split_part (org_id ,''_'',3) = ''CITY'' then org end as city_entry, case when org_type = ''Location Hierarchy'' and split_part (org_id ,''_'',3) = ''REGION'' then org end as region_entry, case when org_type = ''Supervisory'' then (select sup_org_skey || '',~'' || sup_org_id || '',~'' || sup_org_desc from al_hrdl.dim_org where sup_org_id = a.org_id) end as org_entry, case when org_type = ''Pay Group'' then  org_id end as pay_group_ref_id, case when org_type = ''Pay Group'' then  org end as pay_group, case when org_type =  ''Company'' then  org_id end as co_ref_id, case when org_type = ''Company'' then   substring (org , position ('' '' in org)+1) end as  co_nm, case when org_type =  ''Business Organization Hierarchy'' then  org_id end as org_cd, case when org_type = ''Business Organization Hierarchy'' then  org end as  org_desc from og_hrdl.wd_row_lvl_security a where org_type in (''Location Hierarchy'', ''Supervisory'', ''Pay Group'', ''Company'', ''Business Organization Hierarchy'') )a group by a.emp_id  , a.org_role)b inner join al_hrdl.dim_emp_dtls dtl on b.emp_id = dtl.emp_id inner join og_hrdl.wd_col_lvl_security col on col.asgnable_role = b.org_role inner join al_hrdl.wd_hrdl_col_mapping map on col.rpt_field = map.rpt_field and col.security_group = map.security_group  and  col.asgnable_role = map.asgnable_role and col.domain_granted = map.domain_granted and col.functional_area = map.functional_area and map.inactive = false order by 1;INSERT INTO al_hrdl.user_access_tmp1 (emp_skey, emp_id, ge_sso_id, org_role, rpt_field, sup_org_skey, sup_org_id, sup_org_desc, loc_city, loc_cntry, loc_region, org_cd, org_desc, co_ref_id, co_nm, pay_group_ref_id, pay_group) VALUES(9223372036854775807, ''svc_hrdl_etl_prod'', 9223372036854775807, ''All'', ''All'', null, null, null, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), (9223372036854775806, ''svc_hrdl_rpt_prod'', 9223372036854775806, ''All'', ''All'', null, null, null, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ', 5, 'Incremental', 'Y', 'Create', '', now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_al', 'wd_hrdl_col_mapping', 'analyse al_hrdl.user_access_tmp1;', 6, 'Incremental', 'Y', 'Analyse', '', now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_al', 'wd_hrdl_col_mapping', 'truncate al_hrdl.user_access_tmp; insert into al_hrdl.user_access_tmp (emp_skey, emp_id, org_role) select distinct dtl.emp_skey, r.emp_id, r.org_role from og_hrdl.wd_row_lvl_security r inner join al_hrdl.dim_emp_dtls dtl on r.emp_id = dtl.emp_id where r.org_type in (''Location Hierarchy'', ''Supervisory'');  insert into al_hrdl.user_access_tmp (emp_skey, emp_id, org_role) values (9223372036854775807,''svc_hrdl_etl_prod'' , ''All''),(9223372036854775806, ''svc_hrdl_rpt_prod'', ''All'') ; analyse al_hrdl.user_access_tmp; ', 7, 'Incremental', 'Y', 'Truncate,Insert', '', now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_al', 'wd_hrdl_col_mapping', 'insert into al_hrdl.user_access_hist (emp_skey, emp_id,ge_sso_id, org_role, rpt_field,sup_org_skey,sup_org_id, sup_org_desc, loc_city, loc_cntry, loc_region, pay_group_ref_id, pay_group, co_ref_id, co_nm, org_cd, org_desc, etl_insert_dt, etl_insert_by  ) select u.emp_skey, u.emp_id, u.ge_sso_id, u.org_role, u.rpt_field, u.sup_org_skey, u.sup_org_id, u.sup_org_desc, u.loc_city, u.loc_cntry, u.loc_region, u.pay_group_ref_id, u.pay_group, u.co_ref_id, u.co_nm, u.org_cd, u.org_desc, now(), ''svc_hrdl_etl'' from al_hrdl.user_access u left join (select emp_skey, emp_id,ge_sso_id, org_role,string_agg(rpt_field, ''~'') as rpt_field,sup_org_skey,sup_org_id, sup_org_desc, loc_city, loc_cntry,loc_region, pay_group_ref_id, pay_group, co_ref_id, co_nm, org_cd, org_desc from al_hrdl.user_access_tmp1 where rpt_field <> '''' group by emp_skey, emp_id,ge_sso_id, org_role, sup_org_skey,sup_org_id, sup_org_desc, loc_city, loc_cntry,loc_region, pay_group_ref_id, pay_group, co_ref_id, co_nm, org_cd, org_desc order by 1,5 ) tmp on u.emp_skey = tmp.emp_skey and u.org_role = tmp.org_role and u.rpt_field = tmp.rpt_field where (tmp.emp_skey is null and tmp.org_role is null and  tmp.rpt_field is null or  (tmp.emp_skey is not null and tmp.org_role is not null and  tmp.rpt_field is not null and (coalesce(u.emp_id, '''') <> coalesce(tmp.emp_id, '''') or coalesce(u.ge_sso_id::text, '''') <> coalesce(tmp.ge_sso_id::text, '''') or coalesce(u.sup_org_skey, '''') <> coalesce(tmp.sup_org_skey, '''') or coalesce(u.sup_org_id, '''') <> coalesce(tmp.sup_org_id, '''') or coalesce(u.loc_city, '''') <> coalesce(tmp.loc_city, '''') or coalesce(u.loc_cntry, '''') <> coalesce(tmp.loc_cntry, '''') or coalesce(u.loc_region, '''') <> coalesce(tmp.loc_region, '''') or coalesce(u.pay_group_ref_id, '''')<> coalesce(tmp.pay_group_ref_id, '''') or coalesce(u.pay_group, '''') <> coalesce(tmp.pay_group, '''') or coalesce(u.co_ref_id, '''')<> coalesce(tmp.co_ref_id, '''') or coalesce(u.co_nm, '''') <> coalesce(tmp.co_nm, '''') or coalesce(u.org_cd, '''') <> coalesce(tmp.org_cd, '''') or coalesce(u.org_desc, '''') <> coalesce(tmp.org_desc, ''''))));;analyse al_hrdl.user_access_hist; truncate al_hrdl.user_access; insert into al_hrdl.user_access (emp_skey, emp_id,ge_sso_id, org_role, rpt_field,sup_org_skey,sup_org_id, sup_org_desc, loc_city, loc_cntry,loc_region,pay_group_ref_id, pay_group, co_ref_id, co_nm, org_cd, org_desc, etl_insert_dt,  etl_insert_by ) select emp_skey, emp_id,ge_sso_id, org_role,string_agg(rpt_field, ''~''),sup_org_skey,sup_org_id, sup_org_desc, loc_city, loc_cntry,loc_region, pay_group_ref_id, pay_group, co_ref_id, co_nm, org_cd, org_desc, now(), ''svc_hrdl_etl'' from al_hrdl.user_access_tmp1 where rpt_field <> '''' group by emp_skey, emp_id,ge_sso_id, org_role, sup_org_skey,sup_org_id, sup_org_desc, loc_city, loc_cntry,loc_region, pay_group_ref_id, pay_group, co_ref_id, co_nm, org_cd, org_desc order by 1, 5;', 8, 'Incremental', 'Y', 'Insert, Analyse, Truncate, Insert', '', now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Security', 'Sec_hrdl_wd_map_al', 'wd_hrdl_col_mapping', 'analyse al_hrdl.user_access;', 9, 'Incremental', 'Y', 'Analyse', '', now(), NULL, 'svc_hrdl_etl', NULL);

/*------------------------------------------------------------------------------------*/
/*dim_sup_org_hrchy changes */
delete from og_hrdl.hr_etl_scripts where table_name = 'dim_sup_org_hrchy'; 
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Workday', 'WD_hrchy', 'dim_sup_org_hrchy', 'drop table if exists al_hrdl.dim_sup_org_hrchy_tmp;', 1, 'Full', 'Y', 'Drop', '',now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Workday', 'WD_hrchy', 'dim_sup_org_hrchy', 'create table al_hrdl.dim_sup_org_hrchy_tmp as select dtl.emp_id ,dtl.emp_skey ,fact.mgr_id ,dtl.first_nm ,dtl.last_nm ,dtl.prim_work_email_addr ,job.job_skey ,job.job_title ,loc_skey ,fact.sup_org_skey ,dtl.ge_sso_id ,dtl.workday_user_nm ,dtl.source_id from al_hrdl.dim_emp_dtls dtl inner join al_hrdl.emp_fact fact on dtl.emp_skey = fact.emp_skey and fact.is_curr_ind = ''Y'' inner join al_hrdl.dim_job job on job.job_skey = fact.job_skey ;', 2, 'Full', 'Y', 'Create', '',now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Workday', 'WD_hrchy', 'dim_sup_org_hrchy', 'analyse al_hrdl.dim_sup_org_hrchy_tmp;', 3, 'Full', 'Y', 'Analyse', '',now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Workday', 'WD_hrchy', 'dim_sup_org_hrchy', 'truncate al_hrdl.dim_sup_org_hrchy;insert into al_hrdl.dim_sup_org_hrchy (emp_skey,emp_id,first_nm,last_nm,prim_work_email_addr,job_skey,job_title,loc_skey,sup_org_skey,ge_sso_id, mgr_emp_skey,mgr_id,mgr_first_nm,mgr_last_nm,mgr_email_id,mgr_job_skey,mgr_job_title,mgr_loc_skey,mgr_sup_org_skey,mgr_ge_sso_id, mgr_lvl2_emp_skey,mgr_lvl2_id,mgr_lvl2_first_nm,mgr_lvl2_last_nm,mgr_lvl2_email_id,mgr_lvl2_job_skey,mgr_lvl2_job_title,mgr_lvl2_loc_skey,mgr_lvl2_sup_org_skey,mgr_lvl2_ge_sso_id, mgr_lvl3_emp_skey,mgr_lvl3_id,mgr_lvl3_first_nm,mgr_lvl3_last_nm,mgr_lvl3_email_id,mgr_lvl3_job_skey,mgr_lvl3_job_title,mgr_lvl3_loc_skey,mgr_lvl3_sup_org_skey,mgr_lvl3_ge_sso_id, mgr_lvl4_emp_skey,mgr_lvl4_id,mgr_lvl4_first_nm,mgr_lvl4_last_nm,mgr_lvl4_email_id,mgr_lvl4_job_skey,mgr_lvl4_job_title,mgr_lvl4_loc_skey,mgr_lvl4_sup_org_skey,mgr_lvl4_ge_sso_id, mgr_lvl5_emp_skey,mgr_lvl5_id,mgr_lvl5_first_nm,mgr_lvl5_last_nm,mgr_lvl5_email_id,mgr_lvl5_job_skey,mgr_lvl5_job_title,mgr_lvl5_loc_skey,mgr_lvl5_sup_org_skey,mgr_lvl5_ge_sso_id, mgr_lvl6_emp_skey,mgr_lvl6_id,mgr_lvl6_first_nm,mgr_lvl6_last_nm,mgr_lvl6_email_id,mgr_lvl6_job_skey,mgr_lvl6_job_title,mgr_lvl6_loc_skey,mgr_lvl6_sup_org_skey,mgr_lvl6_ge_sso_id, mgr_lvl7_emp_skey,mgr_lvl7_id,mgr_lvl7_first_nm,mgr_lvl7_last_nm,mgr_lvl7_email_id,mgr_lvl7_job_skey,mgr_lvl7_job_title,mgr_lvl7_loc_skey,mgr_lvl7_sup_org_skey,mgr_lvl7_ge_sso_id, mgr_lvl8_emp_skey,mgr_lvl8_id,mgr_lvl8_first_nm,mgr_lvl8_last_nm,mgr_lvl8_email_id,mgr_lvl8_job_skey,mgr_lvl8_job_title,mgr_lvl8_loc_skey,mgr_lvl8_sup_org_skey,mgr_lvl8_ge_sso_id, mgr_lvl9_emp_skey,mgr_lvl9_id,mgr_lvl9_first_nm,mgr_lvl9_last_nm,mgr_lvl9_email_id,mgr_lvl9_job_skey,mgr_lvl9_job_title,mgr_lvl9_loc_skey,mgr_lvl9_sup_org_skey,mgr_lvl9_ge_sso_id, mgr_lvl10_emp_skey,mgr_lvl10_id,mgr_lvl10_first_nm,mgr_lvl10_last_nm,mgr_lvl10_email_id,mgr_lvl10_job_skey,mgr_lvl10_job_title,mgr_lvl10_loc_skey,mgr_lvl10_sup_org_skey,mgr_lvl10_ge_sso_id, mgr_lvl11_emp_skey,mgr_lvl11_id,mgr_lvl11_first_nm,mgr_lvl11_last_nm,mgr_lvl11_email_id,mgr_lvl11_job_skey,mgr_lvl11_job_title,mgr_lvl11_loc_skey,mgr_lvl11_sup_org_skey,mgr_lvl11_ge_sso_id, mgr_lvl12_emp_skey,mgr_lvl12_id,mgr_lvl12_first_nm,mgr_lvl12_last_nm,mgr_lvl12_email_id,mgr_lvl12_job_skey,mgr_lvl12_job_title,mgr_lvl12_loc_skey,mgr_lvl12_sup_org_skey,mgr_lvl12_ge_sso_id, mgr_lvl13_emp_skey,mgr_lvl13_id,mgr_lvl13_first_nm,mgr_lvl13_last_nm,mgr_lvl13_email_id,mgr_lvl13_job_skey,mgr_lvl13_job_title,mgr_lvl13_loc_skey,mgr_lvl13_sup_org_skey,mgr_lvl13_ge_sso_id, mgr_lvl14_emp_skey,mgr_lvl14_id,mgr_lvl14_first_nm,mgr_lvl14_last_nm,mgr_lvl14_email_id,mgr_lvl14_job_skey,mgr_lvl14_job_title,mgr_lvl14_loc_skey,mgr_lvl14_sup_org_skey,mgr_lvl14_ge_sso_id, mgr_lvl15_emp_skey,mgr_lvl15_id,mgr_lvl15_first_nm,mgr_lvl15_last_nm,mgr_lvl15_email_id,mgr_lvl15_job_skey,mgr_lvl15_job_title,mgr_lvl15_loc_skey,mgr_lvl15_sup_org_skey,mgr_lvl15_ge_sso_id, source_id,etl_insert_dt,etl_update_dt,etl_insert_by,etl_updated_by) select emp_dtl.emp_skey, a[1] as emp_id, emp_dtl.first_nm,emp_dtl.last_nm,emp_dtl.prim_work_email_addr ,emp_dtl.job_skey , emp_dtl.job_title, emp_dtl.loc_skey, emp_dtl.sup_org_skey,emp_dtl.ge_sso_id, a[2]::bigint as mgr_emp_skey, a[3] as mgr_id, a[4] as mgr_first_nm, a[5] as mgr_last_nm, a[6] as mgr_email_id, a[7]::bigint  as mgr_job_skey, a[8] as mgr_job_title, a[9]::bigint as mgr_loc_skey, a[10]::bigint as mgr_sup_org_skey, case when a[11] = '''' then null else a[11]::bigint end as mgr_ge_sso_id, a[12]::bigint as mgr_lvl2_emp_skey, a[13] as mgr_lvl2_id, a[14] as mgr_lvl2_first_nm, a[15] as mgr_lvl2_last_nm, a[16] as mgr_lvl2_email_id, a[17]::bigint as mgr_lvl2_job_skey, a[18] as mgr_lvl2_job_title, a[19]::bigint as mgr_lvl2_loc_skey, a[20]::bigint as mgr_lvl2_sup_org_skey, case when a[21] = '''' then null else a[21]::bigint end as mgr_lvl2_ge_sso_id, a[22]::bigint as mgr_lvl3_emp_skey, a[23] as mgr_lvl3_id, a[24] as mgr_lvl3_first_nm, a[25] as mgr_lvl3_last_nm, a[26] as mgr_lvl3_email_id, a[27]::bigint as mgr_lvl3_job_skey, a[28] as mgr_lvl3_job_title, a[29]::bigint as mgr_lvl3_loc_skey, a[30]::bigint as mgr_lvl3_sup_org_skey, case when a[31] = '''' then null else a[31]::bigint end as mgr_lvl3_ge_sso_id, a[32]::bigint as mgr_lvl4_emp_skey, a[33] as mgr_lvl4_id, a[34] as mgr_lvl4_first_nm, a[35] as mgr_lvl4_last_nm, a[36] as mgr_lvl4_email_id, a[37]::bigint as mgr_lvl4_job_skey, a[38] as mgr_lvl4_job_title, a[39]::bigint as mgr_lvl4_loc_skey, a[40]::bigint as mgr_lvl4_sup_org_skey, case when a[41] = '''' then null else a[41]::bigint end as mgr_lvl4_ge_sso_id, a[42]::bigint as mgr_lvl5_emp_skey, a[43] as mgr_lvl5_id, a[44] as mgr_lvl5_first_nm, a[45] as mgr_lvl5_last_nm, a[46] as mgr_lvl5_email_id, a[47]::bigint as mgr_lvl5_job_skey, a[48] as mgr_lvl5_job_title, a[49]::bigint as mgr_lvl5_loc_skey, a[50]::bigint as mgr_lvl5_sup_org_skey, case when a[51] = '''' then null else a[51]::bigint end as mgr_lvl5_ge_sso_id, a[52]::bigint as mgr_lvl6_emp_skey, a[53] as mgr_lvl6_id, a[54] as mgr_lvl6_first_nm, a[55] as mgr_lvl6_last_nm, a[56] as mgr_lvl6_email_id, a[57]::bigint as mgr_lvl6_job_skey, a[58] as mgr_lvl6_job_title, a[59]::bigint as mgr_lvl6_loc_skey, a[60]::bigint as mgr_lvl6_sup_org_skey, case when a[61] = '''' then null else a[61]::bigint end as mgr_lvl6_ge_sso_id, a[62]::bigint as mgr_lvl7_emp_skey, a[63] as mgr_lvl7_id, a[64] as mgr_lvl7_first_nm, a[65] as mgr_lvl7_last_nm, a[66] as mgr_lvl7_email_id, a[67]::bigint as mgr_lvl7_job_skey, a[68] as mgr_lvl7_job_title, a[69]::bigint as mgr_lvl7_loc_skey, a[70]::bigint as mgr_lvl7_sup_org_skey, case when a[71] = '''' then null else a[71]::bigint end as mgr_lvl7_ge_sso_id, a[72]::bigint as mgr_lvl8_emp_skey, a[73] as mgr_lvl8_id, a[74] as mgr_lvl8_first_nm, a[75] as mgr_lvl8_last_nm, a[76] as mgr_lvl8_email_id, a[77]::bigint as mgr_lvl8_job_skey, a[78] as mgr_lvl8_job_title, a[79]::bigint as mgr_lvl8_loc_skey, a[80]::bigint as mgr_lvl8_sup_org_skey, case when a[81] = '''' then null else a[81]::bigint end as mgr_lvl8_ge_sso_id, a[82]::bigint as mgr_lvl9_emp_skey, a[83] as mgr_lvl9_id, a[84] as mgr_lvl9_first_nm, a[85] as mgr_lvl9_last_nm, a[86] as mgr_lvl9_email_id, a[87]::bigint as mgr_lvl9_job_skey, a[88] as mgr_lvl9_job_title, a[89]::bigint as mgr_lvl9_loc_skey, a[90]::bigint as mgr_lvl9_sup_org_skey, case when a[91] = '''' then null else a[91]::bigint end as mgr_lvl9_ge_sso_id, a[92]::bigint as mgr_lvl10_emp_skey, a[93] as mgr_lvl10_id, a[94] as mgr_lvl10_first_nm, a[95] as mgr_lvl10_last_nm, a[96] as mgr_lvl10_email_id, a[97]::bigint as mgr_lvl10_job_skey, a[98] as mgr_lvl10_job_title, a[99]::bigint as mgr_lvl10_loc_skey, a[100]::bigint as mgr_lvl10_sup_org_skey, case when a[101] = '''' then null else a[101]::bigint end as mgr_lvl10_ge_sso_id, a[102]::bigint as mgr_lvl11_emp_skey, a[103] as mgr_lvl11_id, a[104] as mgr_lvl11_first_nm, a[105] as mgr_lvl11_last_nm, a[106] as mgr_lvl11_email_id, a[107]::bigint as mgr_lvl11_job_skey, a[108] as mgr_lvl11_job_title, a[109]::bigint as mgr_lvl11_loc_skey, a[110]::bigint as mgr_lvl11_sup_org_skey, case when a[111] = '''' then null else a[111]::bigint end as mgr_lvl11_ge_sso_id, a[112]::bigint as mgr_lvl12_emp_skey, a[113] as mgr_lvl12_id, a[114] as mgr_lvl12_first_nm, a[115] as mgr_lvl12_last_nm, a[116] as mgr_lvl12_email_id, a[117]::bigint as mgr_lvl12_job_skey, a[118] as mgr_lvl12_job_title, a[119]::bigint as mgr_lvl12_loc_skey, a[120]::bigint as mgr_lvl12_sup_org_skey, case when a[121] = '''' then null else a[121]::bigint end as mgr_lvl12_ge_sso_id, a[122]::bigint as mgr_lvl13_emp_skey, a[123] as mgr_lvl13_id, a[124] as mgr_lvl13_first_nm, a[125] as mgr_lvl13_last_nm, a[126] as mgr_lvl13_email_id, a[127]::bigint as mgr_lvl13_job_skey, a[128] as mgr_lvl13_job_title, a[129]::bigint as mgr_lvl13_loc_skey, a[130]::bigint as mgr_lvl13_sup_org_skey, case when a[131] = '''' then null else a[131]::bigint end as mgr_lvl13_ge_sso_id, a[132]::bigint as mgr_lvl14_emp_skey, a[133] as mgr_lvl14_id, a[134] as mgr_lvl14_first_nm, a[135] as mgr_lvl14_last_nm, a[136] as mgr_lvl14_email_id, a[137]::bigint as mgr_lvl14_job_skey, a[138] as mgr_lvl14_job_title, a[139]::bigint as mgr_lvl14_loc_skey, a[140]::bigint as mgr_lvl14_sup_org_skey, case when a[141] = '''' then null else a[141]::bigint end as mgr_lvl14_ge_sso_id, a[142]::bigint as mgr_lvl15_emp_skey, a[143] as mgr_lvl15_id, a[144] as mgr_lvl15_first_nm, a[145] as mgr_lvl15_last_nm, a[146] as mgr_lvl15_email_id, a[147]::bigint as mgr_lvl15_job_skey, a[148] as mgr_lvl15_job_title, a[149]::bigint as mgr_lvl15_loc_skey, a[150]::bigint as mgr_lvl15_sup_org_skey, case when a[151] = '''' then null else a[151]::bigint end as mgr_lvl15_ge_sso_id, emp_dtl.source_id,  now() as etl_insert_dt , now() as etl_update_dt,''svc_hrdl_etl'' as etl_insert_by,''svc_hrdl_etl'' as etl_updated_by from ( select regexp_split_to_array(a.dtl, ''~'') from (WITH RECURSIVE hrchy (emp_id, mgr_id ) AS (select a.emp_id  , dtl.emp_skey ::varchar  || ''~'' || a.mgr_id::varchar  || ''~'' ||coalesce(dtl.first_nm, '''') || ''~'' ||coalesce(dtl.last_nm, '''') || ''~'' || coalesce(dtl.prim_work_email_addr, '''' ) || ''~'' ||coalesce (dtl.job_skey::varchar, '''' ) || ''~'' || coalesce (dtl.job_title, '''' )|| ''~'' || coalesce(dtl.loc_skey::varchar, '''' )|| ''~'' || coalesce(dtl.sup_org_skey::varchar, '''' ) || ''~'' || coalesce(dtl.ge_sso_id::varchar, '''' ) from  al_hrdl.dim_sup_org_hrchy_tmp a inner join al_hrdl.dim_sup_org_hrchy_tmp dtl on dtl.emp_id = a.mgr_id::varchar where a.emp_id != a.mgr_id union all select p.emp_id , h.mgr_id from  al_hrdl.dim_sup_org_hrchy_tmp p inner join hrchy h on h.emp_id = p.mgr_id where p.emp_id != p.mgr_id ) select hrchy.emp_id || ''~'' ||  string_agg (hrchy.mgr_id::varchar, ''~'') dtl from hrchy group by  hrchy.emp_id union all select a.emp_id::text from al_hrdl.dim_sup_org_hrchy_tmp a where a.mgr_id is null )a ) dt (a) inner join (select tmp.emp_id, tmp.emp_skey, tmp.first_nm,tmp.last_nm,tmp.prim_work_email_addr ,tmp.job_skey , tmp.job_title, tmp.loc_skey, tmp.sup_org_skey, tmp.source_id, tmp.ge_sso_id from al_hrdl.dim_sup_org_hrchy_tmp tmp )emp_dtl on emp_dtl.emp_id = a[1];  insert into al_hrdl.dim_sup_org_hrchy (emp_skey,emp_id,first_nm,last_nm,prim_work_email_addr,job_skey,job_title,loc_skey,sup_org_skey,ge_sso_id, source_id,etl_insert_dt,etl_update_dt,etl_insert_by,etl_updated_by) select emp_skey, emp_id, first_nm, last_nm, prim_work_email_addr, job_skey, job_title, loc_skey, sup_org_skey,ge_sso_id, source_id, now() as etl_insert_dt , now() as etl_update_dt,''svc_hrdl_etl'' as etl_insert_by,''svc_hrdl_etl'' as etl_updated_by from al_hrdl.dim_sup_org_hrchy_tmp where emp_id = mgr_id ;', 4, 'Full', 'Y', 'Truncate, Insert, Insert', '',now(), NULL, 'svc_hrdl_etl', NULL);
INSERT INTO og_hrdl.hr_etl_scripts
(appln_name, group_name, table_name, sql_script, load_order, load_type, active_flag, sql_type, comments, dl_ins_date, dl_upd_date, dl_ins_by, dl_upd_by)
VALUES('HR_Workday', 'WD_hrchy', 'dim_sup_org_hrchy', 'analyse al_hrdl.dim_sup_org_hrchy;', 5, 'Full', 'Y', 'Analyse', '',now(), NULL, 'svc_hrdl_etl', NULL);

UPDATE og_hrdl.hr_etl_scripts
SET sql_script='truncate al_hrdl.dim_org_hrchy_hist_tmp ; insert into al_hrdl.dim_org_hrchy_hist_tmp (sup_org_id,org_emp_direct_rpts, org_mgr_direct_rpts, org_emp_span, org_emp_cnt, org_mgr_span, org_mgr_cnt, child_org_id_str) select ORG.sup_org_id, dir_cnt as org_emp_direct_rpts, dir_mgr_cnt as org_mgr_direct_rpts, sum( b.cnt ) as org_emp_span, c.cnt as org_emp_cnt, sum( b.mgr_cnt ) as org_mgr_span, (c.mgr_cnt) as org_mgr_cnt, coalesce( a.child_org_id, ORG.sup_org_id ) as child_org_id_str from al_hrdl.dim_org org left outer join( with recursive hrchy( sup_org_id, parent_sup_org_id ) as( select sup_org_id, parent_sup_org_id from al_hrdl.dim_org union all select p.sup_org_id, h.parent_sup_org_id from al_hrdl.dim_org p inner join hrchy h on h.sup_org_id = p.parent_sup_org_id ) select parent_sup_org_id, ( parent_sup_org_id || ''~'' || string_agg( sup_org_id::varchar, ''~'' ) ) child_org_id from hrchy group by parent_sup_org_id ) a on org.sup_org_id = a.parent_sup_org_id left outer join( select sup_org_id, count(*) cnt, sum( case when is_mgr = ''Yes'' then 1 else 0 end ) mgr_cnt from al_hrdl.emp_work_hist where end_dt = ''12-31-9999''::date group by sup_org_id ) b on b.sup_org_id = any( string_to_array( a.child_org_id, ''~'' ) ) left outer join( select sup_org_id, count(*) cnt, sum( case when is_mgr = ''Yes'' then 1 else 0 end ) mgr_cnt from al_hrdl.emp_work_hist where end_dt = ''12-31-9999''::date group by sup_org_id ) c on c.sup_org_id = ORG.sup_org_id left outer join( select org.sup_org_id, count(*) dir_cnt, sum( case when is_mgr = ''Yes'' then 1 else 0 end ) dir_mgr_cnt from al_hrdl.dim_org org inner join al_hrdl.emp_work_hist a on a.sup_org_id = org.sup_org_id and a.end_dt = ''12-31-9999''::date and a.emp_id <> coalesce( org.org_mgr_id, - 1 ) group by org.sup_org_id ) d on org.sup_org_id = d.sup_org_id group by ORG.sup_org_id, a.parent_sup_org_id, c.cnt, c.mgr_cnt, dir_cnt, dir_mgr_cnt, a.child_org_id;', sql_type='Truncate, Insert'
WHERE appln_name='HR_Workday' AND group_name='WD_al_fact' AND table_name='dim_org_hrchy_hist' AND load_order=3;

delete from og_hrdl.hr_etl_scripts WHERE table_name='dim_org_hrchy_hist' AND load_order=4;

UPDATE og_hrdl.hr_etl_scripts SET load_order = 4 WHERE table_name='dim_org_hrchy_hist' AND load_order=5;
UPDATE og_hrdl.hr_etl_scripts SET load_order = 5 WHERE table_name='dim_org_hrchy_hist' AND load_order=6;
UPDATE og_hrdl.hr_etl_scripts SET load_order = 6 WHERE table_name='dim_org_hrchy_hist' AND load_order=7;
UPDATE og_hrdl.hr_etl_scripts SET load_order = 7 WHERE table_name='dim_org_hrchy_hist' AND load_order=8;

drop table if exists al_hrdl.dim_org_hrchy_hist_tmp ; 
CREATE TABLE al_hrdl.dim_org_hrchy_hist_tmp (
	sup_org_id varchar(55) NULL,
	org_emp_direct_rpts int8 NULL,
	org_mgr_direct_rpts int8 NULL,
	org_emp_span numeric NULL,
	org_emp_cnt int8 NULL,
	org_mgr_span numeric NULL,
	org_mgr_cnt int8 null, 
	child_org_id_str text 
)
WITH (
	OIDS=FALSE
) ;

ALTER TABLE al_hrdl.dim_org_hrchy_hist_tmp OWNER TO svc_hrdl_etl_prod; 
GRANT ALL ON TABLE al_hrdl.dim_org_hrchy_hist_tmp TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE al_hrdl.dim_org_hrchy_hist_tmp TO bhdlhr_og_hrdl_updater;

create or replace view read_hrdl.dim_org_hrchy_hist_tmp as select * from al_hrdl.dim_org_hrchy_hist_tmp;
ALTER TABLE read_hrdl.dim_org_hrchy_hist_tmp OWNER TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE read_hrdl.dim_org_hrchy_hist_tmp TO bhdlhr_read_vw_hrdl_looker;

/*_pstg changes*/
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.atlas_costing_info_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.atlas_costing_info_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='atlas_costing_info_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.concur_group_mapping_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.concur_group_mapping_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='concur_group_mapping_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.fg_cw_emp_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.fg_cw_emp_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='fg_cw_emp_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.st_activity_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.st_activity_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='st_activity_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.st_assignment_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.st_assignment_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='st_assignment_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.st_attempt_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.st_attempt_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='st_attempt_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.st_weekly_active_attempt_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.st_weekly_active_attempt_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='st_weekly_active_attempt_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.wd_col_lvl_security_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.wd_col_lvl_security_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='wd_col_lvl_security_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.wd_emp_a_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.wd_emp_a_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='wd_emp_a_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.wd_emp_b_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.wd_emp_b_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='wd_emp_b_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.wd_job_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.wd_job_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='wd_job_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.wd_location_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.wd_location_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='wd_location_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.wd_org_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.wd_org_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='wd_org_pstg' AND load_order=3;
UPDATE og_hrdl.hr_etl_scripts SET sql_script= 'delete from og_hrdl.wd_row_lvl_security_pstg where load_date::date = now()::date;vacuum analyse og_hrdl.wd_row_lvl_security_pstg;'|| sql_script, sql_type = 'Delete,Vacuum Analyse,Insert' WHERE  table_name='wd_row_lvl_security_pstg' AND load_order=3;

/*Outbound Changes*/
----------------------------------Country Table Updates--------------------------------------------------------------------------
DROP VIEW read_hrdl.cwt_cntry_wave_list;
DROP TABLE al_hrdl.cwt_cntry_wave_list;

CREATE TABLE al_hrdl.cwt_cntry_wave_list
(
  iso_cntry_cd_2 character varying(2) NOT NULL,
  cntry_nm character varying(100),
  wave_nm character varying(100),
  is_active boolean,
  etl_insert_dt timestamp without time zone,
  etl_update_dt timestamp without time zone,
  etl_insert_by character varying(30),
  etl_updated_by character varying(30),
  concur_cntry character varying(1),
  cwt_cntry character varying(1),
  CONSTRAINT cwt_cntry_wave_list_pkey PRIMARY KEY (iso_cntry_cd_2)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE al_hrdl.cwt_cntry_wave_list   OWNER TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE al_hrdl.cwt_cntry_wave_list TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE al_hrdl.cwt_cntry_wave_list TO bhdlhr_al_hrdl_looker;
GRANT ALL ON TABLE al_hrdl.cwt_cntry_wave_list TO bhdlhr_al_hrdl_updater;

CREATE OR REPLACE VIEW read_hrdl.cwt_cntry_wave_list AS 
 SELECT cwt_cntry_wave_list.iso_cntry_cd_2,
    cwt_cntry_wave_list.cntry_nm,
    cwt_cntry_wave_list.wave_nm,
    cwt_cntry_wave_list.is_active,
    cwt_cntry_wave_list.concur_cntry, 
    cwt_cntry_wave_list.cwt_cntry,
    cwt_cntry_wave_list.etl_insert_dt,
    cwt_cntry_wave_list.etl_update_dt,
    cwt_cntry_wave_list.etl_insert_by,
    cwt_cntry_wave_list.etl_updated_by
   FROM al_hrdl.cwt_cntry_wave_list;

ALTER TABLE read_hrdl.cwt_cntry_wave_list  OWNER TO svc_hrdl_etl_prod;
GRANT ALL ON TABLE read_hrdl.cwt_cntry_wave_list TO svc_hrdl_etl_prod;
GRANT SELECT ON TABLE read_hrdl.cwt_cntry_wave_list TO bhdlhr_read_vw_hrdl_looker;

---------------------------------------CWT--------------------------------------------------------------------------------------------
UPDATE og_hrdl.edl_table
SET  sql_text='select ''Delete'' as action, ''BH'' as "Company", co_gld_net_id as "Subunit", case  when compn_grade like ''EB%'' then ''EB''  when compn_grade = ''SEB'' then ''SB''  when upper(mgmt_lvl)= ''EXECUTIVE LEADERSHIP TEAM & OFFICERS'' then ''OF''  else ''EM'' end as "TravelerType", B.workday_user_nm as "Unique ID", left(first_nm,20) as "First Name", left(mid_nm,20) as "Middle Name", left(last_nm,30) as "Last Name", Prim_work_email_addr as "WorkEmail" from al_hrdl.dim_emp_dtls B inner join al_hrdl.dim_source src on B.source_id = src.source_id and src.source_system_nm = ''WORKDAY'' inner join al_hrdl.emp_work_hist A on A.emp_skey = B.emp_skey inner join al_hrdl.cwt_cntry_wave_list cwt_cntry on upper(A.co_cntry)=upper(cwt_cntry.cntry_nm) where emp_stat = ''Terminated'' and cwt_cntry.wave_nm =''Wave0'' and cwt_cntry=''Y'' and COALESCE(co_ref_id,'''') not in(''6210'',''0990'') and termination_eff_dt between (current_date-7) and current_date'
WHERE flat_file_name='BHUGHES_DEL.txt' and load_order=16 ;
-------------------------------------
UPDATE og_hrdl.edl_table
SET sql_text='with cw_hist as (select emp_skey,emp_id,mgr_id from (select emp_skey,emp_id,mgr_id,row_number() over (partition by emp_id order by end_dt desc) as rnum from al_hrdl.cw_emp_work_hist  where end_dt<>''9999-12-31'' and actual_end_dt between (current_date-7) and current_date)x where rnum=1 and emp_skey not in (select emp_skey from al_hrdl.cw_emp_work_hist where end_dt = ''9999-12-31'' and emp_stat =1 )) select ''Delete'' as action, ''BH'' as "Company", mgr_hist.co_gld_net_id as "Subunit",''CT'' as "TravelerType", B.login_id as "Unique ID", left(first_nm,20) as "First Name", '''' as "Middle Name", left(last_nm,30) as "Last Name", Prim_work_email_addr as "WorkEmail" from al_hrdl.dim_cw_emp_dtls B inner join al_hrdl.dim_source src on B.source_id = src.source_id and src.source_system_nm = ''FIELD GLASS'' inner join  cw_hist A on A.emp_skey = B.emp_skey   left join al_hrdl.emp_work_hist mgr_hist on A.mgr_id::text=mgr_hist.emp_id::text and mgr_hist.end_dt = ''9999-12-31'' and coalesce(co_ref_id,'''') not in (''0990'',''6210'') inner join al_hrdl.cwt_cntry_wave_list cwt_cntry on upper(mgr_hist.co_cntry)=upper(cwt_cntry.cntry_nm) where cwt_cntry.wave_nm =''Wave0'''
WHERE flat_file_name='BHUGHES_DEL.txt' and load_order=32;
------------------------------------------------
UPDATE og_hrdl.edl_table
SET  sql_text='select ''BH'' as "Company", co_gld_net_id as "Subunit", case  when compn_grade like ''EB%'' then ''EB''  when compn_grade = ''SEB'' then ''SB''  when upper(mgmt_lvl) = ''EXECUTIVE LEADERSHIP TEAM & OFFICERS'' then ''OF''  else ''EM'' end as "TravelerType", B.workday_user_nm as "Unique ID", left(first_nm,20) as "First Name", left(mid_nm,20) as "Middle Name", left(last_nm,30) as "Last Name", Prim_work_email_addr as "WorkEmail", prim_work_phone_no as "Work Phone", case  when compn_grade like ''EB%'' then ''EB''  when compn_grade = ''SEB'' then ''SB''  when upper(mgmt_lvl) = ''EXECUTIVE LEADERSHIP TEAM & OFFICERS'' then ''OF''  else ''EM'' end as "Traveler Type", case when B.co_hrchy = ''Legacy O&G'' then case when ch.emp_id is not null then ch.concur_group else null end else co_ref_id end as "Company Code/GLID", case when length(trim(split_part(org_desc, ''-'', 1)))>3 then left(trim(org_desc),3) else trim(split_part(org_desc, ''-'', 1)) end as "Business Segment", case when length(trim(split_part(org_desc, ''-'', 2)))>6 then left(trim(split_part(org_desc, ''-'', 2)),6) else trim(split_part(org_desc, ''-'', 2)) end as "Sub Business", C.loc_region as "Region" , case when length(A.EMP_ID::text) < 8 then LPAD(A.EMP_ID::text,8,''0'') 	else A.EMP_ID::text end  as "Employee ID",case when length(mgr_id::text) < 8 then LPAD(mgr_id::text,8,''0'') else mgr_id::text end  as "Travel Request Approver Employee ID"  from al_hrdl.dim_emp_dtls B inner join al_hrdl.emp_work_hist A on A.emp_skey = B.emp_skey and A.end_dt = ''9999-12-31'' and emp_stat <> ''Terminated'' and coalesce(co_ref_id,'''') not in (''0990'',''6210'') inner join al_hrdl.dim_source src on B.source_id = src.source_id and src.source_system_nm = ''WORKDAY'' left join (select distinct loc_cntry,loc_region from al_hrdl.dim_location where loc_region is not null )C on A.co_cntry = C.loc_cntry left join al_hrdl.emp_costing_hist ch on A.emp_id::text = ch.emp_ID::text and ch.end_dt = ''9999-12-31'' inner join al_hrdl.cwt_cntry_wave_list cwt_cntry on upper(A.co_cntry)=upper(cwt_cntry.cntry_nm) where cwt_cntry.wave_nm =''Wave0'' and cwt_cntry=''Y'''
WHERE flat_file_name='BHUGHES_IMP.txt' and load_order=60;

-------------------------------------------------------CONCUR--------------------------------------------------------------------
---------------305-----------------------------

UPDATE og_hrdl.hr_etl_scripts
SET sql_script='create table  if NOT EXISTS cons_hrdl.ds_concur_305_temp1 AS( select ''305'' AS txn_typ, LEFT( first_nm, 32 ) AS first_nm, LEFT( mid_nm, 32 ) AS mid_nm, LEFT( last_nm, 32 ) AS last_nm, CASE WHEN LENGTH( A.EMP_ID :: text ) < 8 THEN LPAD( A.EMP_ID :: text, 8, ''0'' ) ELSE A.EMP_ID :: text END AS emp_id, Prim_work_email_addr AS prim_work_email_addr, ''en_US'' AS locale_cd, C.iso_cntry_cd_2 AS iso_cntry_cd_2 ,CASE WHEN UPPER(co_cntry) = ''CANADA'' THEN C.iso_cntry_cd_2||''-''||co_loc_st_region  ELSE '''' END AS work_cntry, CASE WHEN B.co_hrchy = ''Legacy O&G'' THEN CASE WHEN ch.emp_id IS NOT NULL THEN UPPER(M.Concur_Ledger) ELSE NULL END ELSE CASE WHEN UPPER(co_cntry) = ''KAZAKHSTAN'' THEN ''BH1_KZ'' WHEN UPPER(co_cntry) = ''ITALY'' THEN ''BH1_IT'' WHEN UPPER(co_cntry) = ''RUSSIAN FEDERATION'' THEN ''BH1_RU'' ELSE ''BH1'' END END AS ledger_cd, currency_cd AS currency_cd, CASE WHEN emp_stat <> ''Terminated'' AND termination_eff_dt IS NULL THEN ''Y'' ELSE ''N'' END AS emp_stat, CASE WHEN B.co_hrchy = ''Legacy O&G'' THEN CASE WHEN ch.emp_id IS NOT NULL THEN UPPER(erp_sys) ELSE NULL END ELSE ''BH1CLNT100'' END AS system_nm, CASE WHEN B.co_hrchy = ''Legacy O&G'' THEN CASE WHEN ch.emp_id IS NOT NULL THEN ch.concur_group :: text ELSE NULL END ELSE co_ref_id :: text END AS org_unit1, ''CC'' AS org_unit2, CASE WHEN B.co_hrchy = ''Legacy O&G'' THEN CASE WHEN ch.emp_id IS NOT NULL THEN legacy_cost_ctr :: text ELSE NULL END ELSE cost_ctr_ref_id :: text END AS org_unit3, CASE WHEN B.co_hrchy = ''Legacy O&G'' THEN CASE WHEN ch.emp_id IS NOT NULL THEN ch.concur_group ELSE NULL END ELSE ''BH1'' END AS custom_field1, CASE WHEN B.co_hrchy = ''Legacy O&G'' THEN CASE WHEN ch.emp_id IS NOT NULL THEN ol_adn ELSE NULL END ELSE '''' END AS custom_field2, LEFT( emp_typ, 32 ) AS custom_field3, job_family_group AS custom_field4, a.busn_seg_desc AS custom_field5, CASE car_allowance_ind WHEN ''true'' THEN ''Y'' ELSE ''N'' END AS custom_field6, CASE WHEN compn_grade LIKE ''EB%'' THEN ''EB'' WHEN compn_grade LIKE ''FLD-%'' THEN ''FIELD'' WHEN compn_grade = ''SEB'' THEN ''SEB'' WHEN UPPER(mgmt_lvl) = ''EXECUTIVE LEADERSHIP TEAM & OFFICERS'' THEN ''OFFICER'' ELSE ''GENERAL'' END AS custom_field7, B.ge_sso_id AS custom_field8, CASE WHEN B.co_hrchy = ''Legacy O&G'' THEN CASE WHEN ch.emp_id IS NOT NULL THEN labor_cd ELSE NULL END ELSE '''' END AS custom_field9, loc_region AS custom_field10, sub_busn_desc AS custom_field11, sap_psn_id AS custom_field17, CASE WHEN B.co_hrchy = ''Legacy O&G'' THEN CASE WHEN ch.emp_id IS NOT NULL THEN UPPER(M.erp_sys) ELSE NULL END ELSE ''BH1'' END AS custom_field20, C.iso_cntry_cd_2 AS custom_field21, CASE WHEN LENGTH( mgr_id :: text ) < 8 THEN LPAD( mgr_id :: text, 8, ''0'' ) ELSE mgr_id :: text END AS mgr_id, ''Y'' AS exp_user, CASE WHEN is_mgr = ''Yes'' THEN ''Y'' ELSE ''N'' END AS exp_apprvr, ''Y'' AS travel_request_user, CASE WHEN is_mgr = ''Yes'' THEN ''Y'' ELSE ''N'' END AS travel_request_apprvr, ''Y'' AS travel_wizard_user, CASE WHEN LENGTH( mgr_lvl2_mgr_id :: text ) < 8 THEN LPAD( mgr_lvl2_mgr_id :: text, 8, ''0'' ) ELSE mgr_lvl2_mgr_id :: text END AS request_apprvr_lvl2_emp_id FROM al_hrdl.dim_emp_dtls B INNER JOIN al_hrdl.emp_work_hist A ON A.emp_skey = B.emp_skey AND end_dt = ''9999-12-31'' LEFT JOIN(select distinct iso_cntry_cd_3,iso_cntry_cd_2,loc_region from  al_hrdl.dim_location where loc_region is not null) C ON A.co_iso_cntry_cd_3= C.iso_cntry_cd_3 INNER JOIN al_hrdl.dim_source src ON B.source_id = src.source_id AND src.source_system_nm = ''WORKDAY'' LEFT JOIN al_hrdl.emp_costing_hist ch ON A.emp_id :: text = ch.emp_ID :: text AND ch.end_dt = ''9999-12-31'' LEFT JOIN al_hrdl.concur_mapping M ON ch.concur_group = M.concur_group WHERE coalesce(emp_stat,'''') <> ''Terminated'' and COALESCE(co_ref_id,'''') not in(''6210'',''0990'') );'
WHERE   table_name='ds_concur_305' AND load_order=2;

------------310---------------------------------------
UPDATE og_hrdl.hr_etl_scripts
SET sql_script='create table  if NOT EXISTS cons_hrdl.ds_concur_310_temp1 AS( select ''310'' AS txn_typ, A.emp_id AS emp_id, B.prim_work_email_addr AS prim_work_email_addr, first_nm AS first_nm, '''' AS mid_nm, last_nm AS last_nm, /*B.prim_work_email_addr AS "Email Address",*/ ''en_US'' AS locale_cd, ''Y'' AS travel_user_ind, CASE A.emp_stat WHEN 1 THEN ''Y'' ELSE ''N'' END AS active, ''Y'' AS no_mid_nm_ind  FROM al_hrdl.cw_emp_work_hist A INNER JOIN al_hrdl.dim_cw_emp_dtls B ON A.emp_skey = B.emp_skey AND end_dt = ''9999-12-31'' AND emp_stat = 1 INNER JOIN al_hrdl.dim_source src ON B.source_id = src.source_id AND src.source_system_nm = ''FIELD GLASS'' left outer join al_hrdl.emp_work_hist mgr_hist on A.mgr_id::text=mgr_hist.emp_id::text and mgr_hist.emp_stat<>''Terminated'' and mgr_hist.end_dt = ''9999-12-31'');'
WHERE  table_name='ds_concur_310' AND load_order=2;
----------------------350---------------------------------
UPDATE og_hrdl.hr_etl_scripts
SET sql_script='create table cons_hrdl.ds_concur_350_tmp as select a.emp_skey, case when length(A.EMP_ID::text)< 8 then LPAD(A.EMP_ID::text,8,''0'') else A.EMP_ID::text end as emp_id, case when length(A.mgr_id::text)< 8 then LPAD(A.mgr_id::text,8,''0'') else A.mgr_id::text end as mgr_id, case when compn_grade like ''EB%'' then coalesce(cwl.iso_cntry_cd_2,'''')|| ''-'' || ''EB'' when compn_grade = ''SEB'' then coalesce(cwl.iso_cntry_cd_2,'''')|| ''-'' || ''SEB-OFFICER'' when upper( mgmt_lvl )= ''EXECUTIVE LEADERSHIP TEAM & OFFICERS'' then coalesce(cwl.iso_cntry_cd_2,'''')|| ''-'' || ''SEB-OFFICER'' else coalesce(cwl.iso_cntry_cd_2,'''')|| ''-'' || ''GENERAL'' end as travel_class_nm, coalesce(cwl.iso_cntry_cd_2,'''')|| ''-'' || ''Baker Hughes'' || '' '' || coalesce(co_gld_net_id::text,'''') as org_unit_div, case when compn_grade like ''EB%'' then ''Traveler Type=EB'' when compn_grade = ''SEB'' then ''Traveler Type=SB'' when upper( mgmt_lvl )= ''EXECUTIVE LEADERSHIP TEAM & OFFICERS'' then ''Traveler Type=OF'' else ''Traveler Type=EM'' end as custom_field1, case when B.co_hrchy = ''Legacy O&G'' then case when ch.emp_id is not null then ''Company Code='' || coalesce(ch.concur_group::text,'''') else ''Company Code='' || '''' end else ''Company Code='' || coalesce(co_ref_id::text,'''') end as custom_field2, ''Business Segment='' || coalesce( case when length(trim(split_part(org_desc, ''-'', 1)))>3 then left(trim(org_desc),3) else trim(split_part(org_desc, ''-'', 1)) end, '''' ) as custom_field3, ''Sub Business='' || coalesce(case when length(trim(split_part(org_desc, ''-'', 2)))>6 then left(trim(split_part(org_desc, ''-'', 2)),6) else trim(split_part(org_desc, ''-'', 2)) end, '''' ) as custom_field4, ''Region='' || coalesce(loc_region,'''') as custom_field5, ''Portrait SubUnit Name='' || coalesce(cwl.iso_cntry_cd_2,'''')|| ''-'' || ''Baker Hughes'' || '' '' || coalesce(co_gld_net_id::text,'''') as custom_field7, b.workday_user_nm, ''Y'' as emp_stat from al_hrdl.emp_work_hist A inner join al_hrdl.dim_emp_dtls B on A.emp_skey = B.emp_skey and end_dt = ''9999-12-31'' left join al_hrdl.emp_costing_hist ch on A.emp_skey = ch.emp_skey and ch.end_dt = ''9999-12-31'' inner join al_hrdl.dim_source src on B.source_id = src.source_id and src.source_system_nm = ''WORKDAY'' /*left outer join al_hrdl.cntry_hemisphere_mapping hm on upper(A.co_cntry)=upper(hm.cntry_nm)*/left outer join al_hrdl.cwt_cntry_wave_list cwl on upper(A.co_cntry)=upper(cwl.cntry_nm) left outer join (select distinct loc_cntry,loc_region from al_hrdl.dim_location where loc_region is not null) L on upper(cwl.cntry_nm) = upper(L.loc_cntry)  where emp_stat <> ''Terminated'' and coalesce(co_ref_id,'''') not in (''0990'',''6210'') and cwl.concur_cntry=''Y'' and cwl.wave_nm =''Wave0'';'
WHERE  table_name='ds_concur_350' AND load_order=2;

-----------------------------
UPDATE og_hrdl.hr_etl_scripts
SET sql_script='create table cons_hrdl.ds_cw_concur_350_tmp as select a.emp_skey, a.emp_id, case when length(A.mgr_id::text)< 8 then LPAD(A.mgr_id::text,8,''0'') else A.mgr_id::text end as mgr_id, cwl.iso_cntry_cd_2 || ''-'' || ''CONTRACTOR'' as travel_class_nm, coalesce(cwl.iso_cntry_cd_2,'''')|| ''-'' || ''Baker Hughes'' || '' '' || coalesce(co_gld_net_id::text,'''') as org_unit_div, ''Traveler Type=CT'' as custom_field1, case when emp_dtls.co_hrchy = ''Legacy O&G'' then case when ch.emp_id is not null then ''Company Code='' || coalesce(ch.concur_group::text,'''') else ''Company Code='' || '''' end else ''Company Code='' || coalesce(co_ref_id::text,'''') end as custom_field2, /*''Business Segment='' || coalesce(split_part(A.org_cd,''_'',3),'''') as custom_field3,*/ ''Business Segment='' || coalesce( case when length(trim(split_part(A.org_cd, ''_'', 3)))>3 then left(trim(split_part(A.org_cd, ''_'', 3)),3) else trim(split_part(A.org_cd, ''_'', 3)) end, '''' ) as custom_field3, /*''Sub Business='' || coalesce(split_part(A.org_cd,''_'',4),'''') as custom_field4,*/ ''Sub Business='' || coalesce(case when length(trim(split_part(A.org_cd, ''_'', 4)))>6 then left(trim(split_part(A.org_cd, ''_'', 4)),6) else trim(split_part(A.org_cd, ''_'', 4)) end, '''' ) as custom_field4, ''Region='' || coalesce(loc_region,'''') as custom_field5, ''Portrait SubUnit Name='' || coalesce(cwl.iso_cntry_cd_2,'''')|| ''-'' || ''Baker Hughes'' || '' '' || coalesce(co_gld_net_id::text,'''') as custom_field7, B.login_id, ''Y'' as emp_stat from al_hrdl.cw_emp_work_hist A inner join al_hrdl.dim_cw_emp_dtls B on A.emp_skey = B.emp_skey and a.end_dt = ''9999-12-31'' inner join al_hrdl.dim_source src on B.source_id = src.source_id and src.source_system_nm = ''FIELD GLASS'' left join al_hrdl.emp_work_hist mgr_hist on A.mgr_id::integer = mgr_hist.emp_id::integer and mgr_hist.end_dt = ''9999-12-31'' left join al_hrdl.emp_costing_hist ch on mgr_hist.emp_skey = ch.emp_skey and ch.end_dt = ''9999-12-31'' left join al_hrdl.dim_emp_dtls emp_dtls on mgr_hist.emp_skey = emp_dtls.emp_skey left outer join al_hrdl.cwt_cntry_wave_list cwl on upper(mgr_hist.co_cntry)=upper(cwl.cntry_nm) left join (select distinct loc_cntry,loc_region from  al_hrdl.dim_location where loc_region is not null) L on mgr_hist.co_cntry = L.loc_cntry /*left outer join al_hrdl.cntry_hemisphere_mapping hm on upper(mgr_hist.co_cntry)=upper(hm.cntry_nm)*/ where A.emp_stat = 1 and coalesce(co_ref_id,'''') not in (''0990'',''6210'') and actual_end_dt is null and cwl.concur_cntry=''Y'' and cwl.wave_nm =''Wave0'';'
WHERE table_name='ds_cw_concur_350' AND load_order=2;

-------------------------
/*Note: Kindly replicate the data from QA to PROD for below 2 one time insert tables. 
al_hrdl.wd_hrdl_col_mapping
al_hrdl.cwt_cntry_wave_list*/