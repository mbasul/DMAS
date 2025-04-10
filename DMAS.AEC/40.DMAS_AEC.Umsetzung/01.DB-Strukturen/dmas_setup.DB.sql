create warehouse DMAS_4X with
    warehouse_type = standard
    warehouse_size = medium
    auto_suspend = 30
    initially_suspended = true
;
grant operate on warehouse DMAS_4X to sysadmin;
grant usage on warehouse DMAS_2X to sysadmin;
use warehouse COMPUTE_WH;

create transient database if not exists DMAS
    data_retention_time_in_days = 0
;
grant ownership on database DMAS to sysadmin;
grant ownership on schema DMAS.PUBLIC to sysadmin;

use role sysadmin;

create transient schema if not exists AOEC
    comment = 'Atlas of Economic Complexity'
;

create or replace stage DMAS.AOEC.AOEC_FILES_MASTERDATA
    encryption = (type = 'SNOWFLAKE_SSE')
;
create or replace stage DMAS.AOEC.AOEC_FILES_HS12
    encryption = (type = 'SNOWFLAKE_SSE')
;
create or replace stage DMAS.PUBLIC.FILES_UPLOAD
    encryption = (type = 'SNOWFLAKE_SSE')
;

