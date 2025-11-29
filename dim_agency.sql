-- dim_agency.sql
CREATE TABLE `ninth-goal-478702-f8.311_dataset.dim_agency` AS
SELECT DISTINCT
  agency AS agency_name,
  GENERATE_UUID() AS agency_key
FROM `ninth-goal-478702-f8.311_dataset.311_cleaned`;
