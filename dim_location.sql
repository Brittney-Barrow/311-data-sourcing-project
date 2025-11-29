-- dim_location.sql
CREATE TABLE `ninth-goal-478702-f8.311_dataset.dim_location` AS
SELECT DISTINCT
  city,
  borough,
  latitude,
  longitude,
  GENERATE_UUID() AS location_key
FROM `ninth-goal-478702-f8.311_dataset.311_cleaned`;
