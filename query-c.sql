-- Select average values of PM2_5 and VPM2_5 for each station for all available data
SELECT 
    S.SiteName,          -- Selecting the name of the station
    AVG(R.PM2_5) AS AvgPM2_5,  -- Calculating the average value of PM2_5
    AVG(R.VPM2_5) AS AvgVPM2_5 -- Calculating the average value of VPM2_5
FROM 
    mydb.Readings AS R   -- From the Readings table
JOIN 
    mydb.Station AS S ON R.Site_ID = S.Site_ID  -- Joining with the Station table on Site_ID
GROUP BY 
    S.SiteName;   -- Grouping the results by station name

-- This query will output the average concentrations of PM2_5 and VPM2_5 for each station
-- based on all the readings available in the database.
-- basically where clause is deleted.
-- since we cleansed the data before inserting into mysql, not every station is listed after this query.