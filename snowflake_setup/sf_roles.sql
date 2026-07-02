use role securityadmin;

create role if not exists raw_write_ar;
create role if not exists raw_read_ar;

create role if not exists engineering_role;
create role if not exists analyst_role;


use role accountadmin;

grant usage on database data_jobs to role raw_write_ar;
grant all privileges on future schemas in database data_jobs to role raw_write_ar;
grant all privileges on future tables in database data_jobs to role raw_write_ar;

grant usage on database data_jobs to role raw_read_ar;
grant usage on future schemas in database data_jobs to role raw_read_ar;
grant select on future tables in database data_jobs to role raw_read_ar;


use role security admin;

grant usage on all schemas in database data_jobs to role raw_read_ar;
grant select on all tables in database data_jobs to role raw_read_ar;

grant role raw_write_ar to role engineering_role;
grant role raw_read_ar to role engineering_role;

grant role raw_read_ar to role analyst_role;

grant role engineering role to role sysadmin;
grant role analyst_role to role sysadmin;

grant role engineering role to user user1;
