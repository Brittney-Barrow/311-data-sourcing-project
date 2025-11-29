-- dim_date.sql
CREATE TABLE `ninth-goal-478702-f8.311_dataset.dim_date` AS
SELECT DISTINCT
  created_date,
  year,
  month,
  day,
  hour,
  GENERATE_UUID() AS date_key
FROM `ninth-goal-478702-f8.311_dataset.311_cleaned`;
