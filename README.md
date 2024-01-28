# Modelling & Mapping Bristol Air Quality Data

This project involves designing and implementing a database to model and analyze air quality data in Bristol. Utilizing both SQL and NoSQL databases, the goal is to provide comprehensive insights into air quality trends and patterns.

### Background & context 

Levels of various air borne pollutants such as Nitrogen Monoxide (NO), Nitrogen Dioxide (NO2) and particulate matter (also called particle pollution) are all major contributors to the measure of overall air quality. For instance, NO2 is measured using micrograms in each cubic metre of air (㎍/m3). A microgram (㎍) is one millionth of a gram. A concentration of 1 ㎍/m3 means that one cubic metre of air contains one microgram of pollutant. To protect our health, the UK Government sets two air quality objectives for NO2 in their [Air Quality Strategy](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/69336/pb12654-air-quality-strategy-vol1-070712.pdf).
1. The hourly objective, which is the concentration of NO2 in the air, averaged over a period of one hour.
2. The annual objective, which is the concentration of NO2 in the air, averaged 
over a period of a year.

The following table shows the colour encoding and the levels for Objective 1 above, the mean hourly ratio, adopted in the UK.
![image](https://github.com/denizcansuturan/Air_Quality_Bristol/assets/121376005/136173e7-f474-44db-8e11-637210d90e3e)

### Input Data 
It provides data ranging from 1993 to 22 October 2023 taken from 19 monitoring stations in and around Bristol. Monitors may suffer downtime and may become defunct, so the data isn’t always complete for all stations.

### Technologies Used
- **SQL Database**: MySQL
- **NoSQL Database**: MongoDB
- **Data Analysis**: Python

### Database Design
The database design includes ER diagrams and schema designs, ensuring efficient data storage and retrieval.

### Queries and Analysis
The project uses a variety of SQL and NoSQL queries for data manipulation and analysis. Key insights are drawn from these queries.
