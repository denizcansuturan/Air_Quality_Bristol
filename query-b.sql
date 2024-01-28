-- Select average values of PM2_5 and VPM2_5 for each station for the year 2022 during 08:00 hours
-- Return the mean values of PM2.5 (particulate matter <2.5 micron diameter) & VPM2.5 (volatile particulate matter <2.5 micron diameter) by each station for the year 2022 for readings taken on or near 08:00 hours (peak traffic intensity)
SELECT 
    S.SiteName,         -- Selecting the name of the station
    AVG(R.PM2_5) AS AvgPM2_5,  -- Calculating the average value of PM2_5
    AVG(R.VPM2_5) AS AvgVPM2_5 -- Calculating the average value of VPM2_5
FROM 
    mydb.Readings AS R  -- From the Readings table
JOIN 
    mydb.Station AS S ON R.Site_ID = S.Site_ID  -- Joining with the Station table on Site_ID
WHERE 
    YEAR(R.Date_Time) = 2022  -- Filtering readings from the year 2022
    AND HOUR(R.Date_Time) = 8 -- Filtering readings around the 08:00 hour
GROUP BY 
    S.SiteName;  -- Grouping the results by station name

-- This query will output the average concentrations of PM2_5 and VPM2_5 for each station,
-- specifically for readings taken at around 08:00 hours, during the year 2022.
