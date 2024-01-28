-- Selects the date/time, station name, and NOx value from Readings and Station tables
SELECT 
    R.Date_Time,  -- Date and time of the reading
    S.SiteName,   -- Name of the station
    R.NOx         -- NOx value from the reading
FROM 
    mydb.Readings AS R  -- From the Readings table
JOIN 
    mydb.Station AS S ON R.Site_ID = S.Site_ID  -- Join with the Station table on Site_ID
WHERE 
    YEAR(R.Date_Time) = 2022  -- Filter the records to only include readings from the year 2022
ORDER BY 
    R.NOx DESC  -- Order the results by the NOx value in descending order
LIMIT 1;  -- Limit the results to only the top record (highest NOx reading for 2022)