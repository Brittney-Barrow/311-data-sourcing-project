# 311-data-sourcing-project
CIS 9440 Assignment 1 – NYC 311 Data Sourcing (December 2023)

**Data Source:**  
- NYC Open Data – 311 Service Requests for December 2023  
- Link: [https://data.cityofnewyork.us/resource/erm2-nwe9.csv?$where=created_date between '2023-12-01T00:00:00' and '2023-12-31T23:59:59'&$select=created_date,closed_date,agency,complaint_type,descriptor,city,status,borough,latitude,longitude,location&$order=created_date ASC&$limit=500000](https://data.cityofnewyork.us/resource/erm2-nwe9.csv?$where=created_date%20between%20'2023-12-01T00:00:00'%20and%20'2023-12-31T23:59:59'&$select=created_date,closed_date,agency,complaint_type,descriptor,city,status,borough,latitude,longitude,location&$order=created_date%20ASC&$limit=500000)
| Field Name     | Description                              | Data Type |            
| -------------- | ---------------------------------------- | --------- | 
| created_date   | Date and time the request was created    | VARCHAR   | 
| closed_date    | Date and time the request was closed     | VARCHAR   |
| agency         | Agency responsible for handling request  | VARCHAR   |
| complaint_type | High-level category of complaint         | VARCHAR   | 
| descriptor     | Specific description of complaint        | VARCHAR   | 
| city           | City where request originated            | VARCHAR   |
| status         | Status of the service request            | VARCHAR   | 
| borough        | Borough where request originated         | VARCHAR   |
| latitude       | Latitude coordinate of request location  | VARCHAR   | 
| longitude      | Longitude coordinate of request location | VARCHAR   |
| location       | Text description of request location     | VARCHAR   |


