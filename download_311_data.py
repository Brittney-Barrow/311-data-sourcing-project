import requests

url = "https://data.cityofnewyork.us/resource/erm2-nwe9.csv?$where=created_date between '2023-12-01T00:00:00' and '2023-12-31T23:59:59'&$select=created_date,closed_date,agency,complaint_type,descriptor,city,status,borough,latitude,longitude,location&$order=created_date ASC&$limit=500000"

response = requests.get(url)

with open("311_December_2023.csv", "wb") as file:
    file.write(response.content)

print("CSV downloaded successfully.")
