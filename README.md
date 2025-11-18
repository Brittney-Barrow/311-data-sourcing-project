# 311-data-sourcing-project
CIS 9440 Assignment 1 – NYC 311 Data Sourcing (December 2023)

## 1. Data Sourcing

**Data Source:**  
- NYC Open Data – 311 Service Requests for December 2023  
- Link: [https://data.cityofnewyork.us/resource/erm2-nwe9.csv?$where=created_date between '2023-12-01T00:00:00' and '2023-12-31T23:59:59'&$select=created_date,closed_date,agency,complaint_type,descriptor,city,status,borough,latitude,longitude,location&$order=created_date ASC&$limit=500000](https://data.cityofnewyork.us/resource/erm2-nwe9.csv?$where=created_date%20between%20'2023-12-01T00:00:00'%20and%20'2023-12-31T23:59:59'&$select=created_date,closed_date,agency,complaint_type,descriptor,city,status,borough,latitude,longitude,location&$order=created_date%20ASC&$limit=500000)

**Data Dictionary:**  
- An Excel sheet is provided with the column names, descriptions, datatypes, and any constraints.  
- File: `311 December Data Dictionary.xlsx`

**Data Fields Selected:**  
- created_date  
- closed_date  
- agency  
- complaint_type  
- descriptor  
- city  
- status  
- borough  
- latitude  
- longitude  
- location

---

## 2. Data Storage

**Storage Choice:**  
- MySQL Database

**Database and Table:**  
- Database: `nyc311`  
- Table: `service_requests`  
- Table schema matches the columns listed in the data dictionary.

**Data Storage Method:**  
- `311 December.csv`.  
- Imported directly into MySQL
- This method ensured all rows from December 2023 were properly stored in MySQL.
 


- No Python scripts were required; CSV import via MySQL Workbench satisfies the assignment requirements.  
- All data is stored locally and properly organized within the `service_requests` table.  
