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

[311_data_transformation.txt](https://github.com/user-attachments/files/23835310/311_data_transformation.txt)import pandas as pd

# -----------------------------
# Step 1: Load the data
# -----------------------------
gcs_path = "https://storage.googleapis.com/your_bucket_name/311_data.csv"  # Replace with your public link
df = pd.read_csv(gcs_path)
print("Initial DataFrame shape:", df.shape)

# -----------------------------
# Step 2: Standardize dates
# -----------------------------
df['created_date'] = pd.to_datetime(df['created_date']).dt.strftime('%Y-%m-%d')
df['closed_date'] = pd.to_datetime(df['closed_date']).dt.strftime('%Y-%m-%d')

# Split date into components
df['year'] = pd.to_datetime(df['created_date']).dt.year
df['quarter'] = pd.to_datetime(df['created_date']).dt.quarter
df['month'] = pd.to_datetime(df['created_date']).dt.month
df['day'] = pd.to_datetime(df['created_date']).dt.day
df['hour'] = pd.to_datetime(df['created_date']).dt.hour

# -----------------------------
# Step 3: Remove duplicates and NULLs
# -----------------------------
df = df.drop_duplicates()
df = df.dropna(subset=['created_date', 'complaint_type'])

# Optional: create a unique request ID
df['request_id'] = range(1, len(df) + 1)

# -----------------------------
# Step 5: Correct data types
# -----------------------------
df['latitude'] = pd.to_numeric(df['latitude'], errors='coerce')
df['longitude'] = pd.to_numeric(df['longitude'], errors='coerce')

string_columns = ['agency', 'complaint_type', 'descriptor', 'city', 'status', 'borough', 'location']
for col in string_columns:
    df[col] = df[col].astype(str)

print("Data types corrected")

# -----------------------------
# Step 6: Add derived columns (optional)
# -----------------------------
df['year_month'] = df['year'].astype(str) + '-' + df['month'].astype(str).str.zfill(2)
df['duration_days'] = (pd.to_datetime(df['closed_date']) - pd.to_datetime(df['created_date'])).dt.days

print("Additional columns added")

# -----------------------------
# Step 7: Create data dictionary
# -----------------------------
data_dict = pd.DataFrame({
    'Field Name': ['request_id', 'created_date', 'closed_date', 'agency',
                   'complaint_type', 'descriptor', 'city', 'status', 'borough',
                   'latitude', 'longitude', 'location', 'year', 'month', 'day',
                   'hour', 'year_month', 'duration_days'],
    'Data Type': ['Integer', 'Date', 'Date', 'String', 'String', 'String',
                  'String', 'String', 'String', 'Float', 'Float', 'String',
                  'Integer', 'Integer', 'Integer', 'Integer', 'String', 'Integer'],
    'Description': [
        'Unique identifier for each request',
        'Date the request was created',
        'Date the request was closed',
        'Agency handling the request',
        'Type of complaint',
        'Detailed descriptor of the complaint',
        'City of the incident',
        'Current status of the request',
        'Borough of the incident',
        'Latitude coordinate of the incident',
        'Longitude coordinate of the incident',
        'Full address/location description',
        'Year the request was created',
        'Month the request was created',
        'Day of the month the request was created',
        'Hour of the day the request was created',
        'Combined year and month',
        'Number of days between created and closed date'
    ],
    'Source Column': ['index', 'created_date', 'closed_date', 'agency',
                      'complaint_type', 'descriptor', 'city', 'status', 'borough',
                      'latitude', 'longitude', 'location', 'created_date',
                      'created_date', 'created_date', 'created_date',
                      'year+month', 'closed_date-created_date'],
    'Destination Column': ['request_id', 'created_date', 'closed_date', 'agency',
                           'complaint_type', 'descriptor', 'city', 'status', 'borough',
                           'latitude', 'longitude', 'location', 'year', 'month', 'day',
                           'hour', 'year_month', 'duration_days']
})

# Export data dictionary
data_dict.to_csv('311_data_dictionary.csv', index=False)
print("Data dictionary exported")

# -----------------------------
# Step 8: Export cleaned data
# -----------------------------
df.to_csv('311_data_cleaned.csv', index=False)
print("Cleaned 311 data exported")

print("Step 1 transformation complete.")



[311_data_dictionary.csv](https://github.com/user-attachments/files/23835303/311_data_dictionary.csv)
Field Name,Data Type,Description,Source Column,Destination Column
request_id,Integer,Unique identifier for each request,index,request_id
created_date,Date,Date the request was created,created_date,created_date
closed_date,Date,Date the request was closed,closed_date,closed_date
agency,String,Agency handling the request,agency,agency
complaint_type,String,Type of complaint,complaint_type,complaint_type
descriptor,String,Detailed descriptor of the complaint,descriptor,descriptor
city,String,City of the incident,city,city
status,String,Current status of the request,status,status
borough,String,Borough of the incident,borough,borough
latitude,Float,Latitude coordinate of the incident,latitude,latitude
longitude,Float,Longitude coordinate of the incident,longitude,longitude
location,String,Full address/location description,location,location
year,Integer,Year the request was created,created_date,year
month,Integer,Month the request was created,created_date,month
day,Integer,Day of the month the request was created,created_date,day
hour,Integer,Hour of the day the request was created,created_date,hour
year_month,String,Combined year and month,year+month,year_month
duration_days,Integer,Number of days between created and closed date,closed_date-created_date,duration_days

