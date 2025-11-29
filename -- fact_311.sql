-- fact_311.sql
CREATE TABLE `ninth-goal-478702-f8.311_dataset.fact_311` AS
SELECT
  t.*,
  a.agency_key,
  c.complaint_key,
  l.location_key,
  d.date_key
FROM `ninth-goal-478702-f8.311_dataset.311_cleaned` t
LEFT JOIN `ninth-goal-478702-f8.311_dataset.dim_agency` a
  ON t.agency = a.agency_name
LEFT JOIN `ninth-goal-478702-f8.311_dataset.dim_complaint` c
  ON t.complaint_type = c.complaint_type
LEFT JOIN `ninth-goal-478702-f8.311_dataset.dim_location` l
  ON t.city = l.city
  AND t.borough = l.borough
LEFT JOIN `ninth-goal-478702-f8.311_dataset.dim_date` d
  ON t.created_date = d.created_date;
