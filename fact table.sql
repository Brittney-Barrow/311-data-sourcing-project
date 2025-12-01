CREATE OR REPLACE TABLE `ninth-goal-478702-f8.311_dataset.311_enriched` AS
SELECT
  *,
  GENERATE_UUID() AS agency_key,
  GENERATE_UUID() AS complaint_key,
  GENERATE_UUID() AS location_key,
  GENERATE_UUID() AS date_key
FROM `ninth-goal-478702-f8.311_dataset.311_cleaned`;

CREATE OR REPLACE TABLE `ninth-goal-478702-f8.311_dataset.dim_agency` AS
SELECT DISTINCT agency_key, agency
FROM `ninth-goal-478702-f8.311_dataset.311_enriched`;

CREATE OR REPLACE TABLE `ninth-goal-478702-f8.311_dataset.dim_complaint` AS
SELECT DISTINCT complaint_key, complaint_type
FROM `ninth-goal-478702-f8.311_dataset.311_enriched`;

CREATE OR REPLACE TABLE `ninth-goal-478702-f8.311_dataset.dim_location` AS
SELECT DISTINCT location_key, city, borough
FROM `ninth-goal-478702-f8.311_dataset.311_enriched`;

CREATE OR REPLACE TABLE `ninth-goal-478702-f8.311_dataset.dim_date` AS
SELECT DISTINCT date_key, created_date
FROM `ninth-goal-478702-f8.311_dataset.311_enriched`;

CREATE OR REPLACE TABLE `ninth-goal-478702-f8.311_dataset.fact_311` AS
SELECT
  created_date,
  agency,
  complaint_type,
  city,
  borough,
  status,
  agency_key,
  complaint_key,
  location_key,
  date_key
FROM `ninth-goal-478702-f8.311_dataset.311_enriched`;

