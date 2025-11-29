-- dim_complaint.sql
CREATE TABLE `ninth-goal-478702-f8.311_dataset.dim_complaint` AS
SELECT DISTINCT
  complaint_type,
  descriptor,
  GENERATE_UUID() AS complaint_key
FROM `ninth-goal-478702-f8.311_dataset.311_cleaned`;
