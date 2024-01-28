# NoSQL Implementation Report for Air Quality Data of Station 206

## Introduction

The implementation of a NoSQL database—MongoDB for the purpose of tracking air quality data is described in detail in this study. For a specific monitoring station (Station ID 206), a prototype implementation using a sample dataset is included. The report also compares the use of de-normalized (NoSQL) data models with normalized (relational) data models, highlighting the reasons for choosing MongoDB over other database systems like BaseX.

## Part 1: MongoDB Selection Reason and Downloading

### 1.1 Why MongoDB?

MongoDB was chosen for this advantages:

- **Direct CSV Import:** MongoDB allows direct import of CSV files, ease the data importing process.
- **User-Friendly Interface:** It offers a more intuitive user interface for managing and querying data, especially for beginners. 
- **Key-Value Store:** Key-value storage model is ideal for the unstructured nature of air quality data.

### 1.2 Downloading MongoDB

MongoDB Compass was downloaded and installed from the official MongoDB website. The installation process was straightforward, involving setting up the MongoDB server and configuring it to host the air quality dataset. Also, mongotools was installed since mongoimport is used to import csv file.

## Part 2: Exploratory Analysis of Stations with Python

### 2.1 Selection of Station ID 206

Station ID 206 was selected based on an exploratory analysis using Python. This station had the lowest record count (8760 entries), making it suitable for getting all data to MongoDB for a comprehensive and accurate analysis.

### 2.2 Data Cleaning and Preparation

The dataset initially contained several other columns, but only `Date_Time`, `Site_ID`, `NOx`, `NO2`, and `NO` were retained. Other columns were dropped due to they were fully null and lack of information, ensuring a focused and efficient analysis.

```python
import pandas as pd

df = pd.read_csv("C:/Users/deniz/Desktop/UWE First Semester Modules Work/DMF - Data Management Fundamentals/Assignment/TASK3/cleansed_dataset.csv")
y = df['Site_ID'].value_counts()
task6_206 = df[df['Site_ID'] == 206]

task6_206['Date_Time'] = pd.to_datetime(task6_206['Date_Time'], format='%Y-%m-%d %H:%M:%S', errors='coerce')
# Check for columns that are completely null:
task6_206.info()

x = task6_206[['Date_Time', 'Site_ID', 'NOx', 'NO2', 'NO']]
x.to_csv("TASK6/task6_206.csv", index=False) # to import MongoDB later.
x['NO2'].mean() # to check the query from MongoDB later
```

## Part 3: Queries from MongoDB

### 3.1 Implementation of Queries

The MongoDB database was queried to analyze the NO2 levels from Station ID 206. The queries aimed to classify NO2 levels into high, medium, and low categories and to calculate the mean NO2 level. Station and constituency files also imported as collections in the same database. Also, for the highest level of NO2, station and constituency info is extracted to contact the relevant authorities a.k.a. MP of that constituency.

![Colections in MongoDB](https://github.com/denizcansuturan/Air_Quality_Bristol/blob/main/Collections.png?raw=true)
*Figure 1: MongoDB collections showing the storage size and document count for the chosen station.*


### 3.2 Query Examples

A series of screenshots below shows the execution of various queries within MongoDB Compass. These screenshots demonstrate how data is filtered and aggregated to extract meaningful insights regarding NO2 levels.

**High NO2 Levels Query:**

![High NO2 Levels Query](https://github.com/denizcansuturan/Air_Quality_Bristol/blob/main/HighLevelOfNO2.png?raw=true)
*Figure 2: Query to filter records with high NO2 levels.*

This query filters out documents where the NO2 level is greater than 401, indicating high pollution events according to the UK Government air quality objectives for NO2 in their Air Quality Strategy. There is only one record for this station.

**Moderate NO2 Levels Query:**

![Moderate NO2 Levels Query](https://github.com/denizcansuturan/Air_Quality_Bristol/blob/main/ModerateLevelOfNO2.png?raw=true)
*Figure 3: Query to filter records with medium NO2 levels.*

The above query filters the documents to find NO2 levels that are between 201 and 401, which are Moderate levels of pollution.

**Low NO2 Levels Query:**

![Low NO2 Levels Query](https://github.com/denizcansuturan/Air_Quality_Bristol/blob/main/LowLevelOfNO2.png?raw=true)
*Figure 4: Query to filter records with low NO2 levels.*

The above query filters the documents to find NO2 levels that are lower than 201, which are low levels of pollution.

**NO2 Mean Calculation Query:**
![NO2 Mean Calculation Query](https://github.com/denizcansuturan/Air_Quality_Bristol/blob/main/MeanOfNO2.png?raw=true)
*Figure 5: Query to calculate the mean of NO2 levels.*

This aggregation operation calculates the average NO2 level across all documents in the collection, providing an overall sense of the air quality in this station.

### 4.3 Insights from Queries


![All info of high level NO2 station](https://github.com/denizcansuturan/Air_Quality_Bristol/blob/main/RECORD_HighLevelOfNO2.png?raw=true)
*Figure 6: Investigation of high level NO2 station*

This aggregation was a quite important practice since using lookup and match a pipeline is created emphasizing the importance of noSQL databases. It seems that problematic air quality is in the MP Thangam Debbonarie jurisdiction. This may be brought to his attention. 


## Part 4: Use Cases and Justification of De-normalized (NoSQL) Data Models

### 4.1 Overview of NoSQL vs. Relational Data Models

NoSQL databases, known for their flexible schemas, are designed to handle large volumes of unstructured or semi-structured data. They are ideal for applications where data requirements are not fully known in advance or are expected to change over time. On the other hand, relational databases use a structured schema and are highly suitable for complex queries and transactional applications.

### 4.2 Advantages of NoSQL in Air Quality Monitoring

- **Scalability:** NoSQL databases like MongoDB can handle vast amounts of data, beneficial for processing large datasets from air quality readings. Even though we added a sample dataset, original dataset is quite large.
- **Flexibility:** They can easily get adjusted to changes in data structures, such as adding new sensor data types without disrupting existing data.
- **Speed:** NoSQL databases offer faster data retrieval, crucial for real-time air quality monitoring and analysis.

### 4.3 Use Cases

- **Real-time Data Analysis:** Monitoring stations generate large volumes of data that require real-time analysis. The de-normalized nature of NoSQL databases allows for faster queries, which is crucial for both real-time and historical data analysis.
- **Predictive Modeling:** NoSQL databases can handle the diverse datasets needed for predictive models in air quality forecasting.
- **Reporting and Visualization:** They provide the necessary speed and flexibility to power interactive dashboards for air quality data visualization.
- **Geospatial Features:** Many NoSQL databases offer built-in support for geospatial data, which can be highly beneficial for air quality monitoring.

## References:

Secretary of State for Environment, Food and Rural Affairs,Scottish Executive, Welsh Assembly Government and Department of
the Environment Northern Ireland(2007) *The Air Quality Strategy for England, Scotland, Wales and Northern Ireland (Volume 1)*[online]. London:The Stationery Office. (Cm 7169). Available from: https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/69336/pb12654-air-quality-strategy-vol1-070712.pdf [Accessed July 2007].

