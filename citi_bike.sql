--/Identifying the top 20 popular start stations
SELECT top 20[Start Station ID],[Start Station Name],COUNT(*) AS number_of_trips
FROM NYCitiBikes
GROUP BY [Start Station Name],[Start Station ID]
ORDER BY number_of_trips DESC

---/What are the Top 10 popular end stations?
SELECT top 10[End Station ID],[End Station Name],COUNT(*) AS number_of_trips
FROM NYCitiBikes
GROUP BY [End Station Name],[End Station ID]
ORDER BY number_of_trips DESC;

--Peak usage times 
WITH T1 AS 
(
SELECT [Start Station ID],
RIGHT([Start Time],7) AS tym
	FROM NYCitiBikes
)
SELECT
    DATEPART(HOUR,tym) AS timing,
	COUNT(*) AS usage_count
	FROM T1
	GROUP BY  DATEPART(HOUR,tym)
	ORDER BY usage_count DESC

--Which age group rents the most bikes?
SELECT [Age Groups],
COUNT([Bike ID]) AS rented_bikes
FROM NYCitiBikes
GROUP BY [Age Groups]
ORDER BY rented_bikes DESC

--How does the average trip duration vary across different age groups, and over time?
SELECT [Age Groups],ROUND(AVG(Trip_Duration_in_min),0)AS avg_trip_duration_in_min
FROM NYCitiBikes
GROUP BY [Age Groups]
ORDER BY avg_trip_duration_in_min DESC;

--How does bike rental vary across the two user groups (one-time users vs long-term subscribers) on different days of the week? 
SELECT [Weekday], [User Type], Count(*) AS number_of_user_type
FROM NYCitiBikes
GROUP BY [User Type],[Weekday]

-- Monthly rents across the months
SELECT [Month], COUNT([Bike ID]) AS num_of_bikes_rented
FROM NYCitiBikes
GROUP BY [Month]

--