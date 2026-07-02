use role sysadmin;
use database data_jobs;
use schema motherduck_migration;

-- scenario: a pipeline run corrupted the job_postings_fact table at 2 am
-- downstream dashboards are broken and we must recover the table to its exact state at 1:59 pm

create or replace table job_postings_fact_restored
  clone job_postings_fact
  before (statement => 01b2c3d4-0000-1111-0000-555566667777);

alter table job_postings_fact swap with job_postings_fact_restored;

drop table job_postings_fact_restored;


-- scenario: a drop statement made in prod instead of test deletes the job_postings_fact table

drop table motherduck_migration.job_postings_fact;

-- confirm the table was actually deleted
select * from motherduck_migration.job_postingss_fact;

-- recover the table
undrop table motherduck_migration.job_postings_fact;
