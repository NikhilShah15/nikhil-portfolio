CREATE DATABASE bike_rental_1 ;
use bike_rental_1;
show tables ;
SELECT * FROM bike_rental_1
LIMIT 10 ;

-- Q1 At what hour of the day bike rented highest and lowest .
-- But in data there is no direct hour so have to create it manually

SELECT 
    HOUR(datetime) AS rental_hour,
    ROUND(AVG(count), 0) AS rentals
FROM bike_rental_1
GROUP BY HOUR(datetime)
ORDER BY rental_hour;


-- Q2 CASE WHERE Wokringday or not

SELECT
    CASE
        WHEN workingday = 1 THEN 'Working_day'
        ELSE 'Non_Working_day'
    END AS Day_Type,
    ROUND(AVG(count), 0) AS RENTALS
FROM bike_rental_1
GROUP BY Day_Type;


-- Q3 BIKE RENTAL DEMAND BY SEASON

SELECT
    CASE
        WHEN season = 1 THEN 'Spring'
	    WHEN season = 2 THEN 'Summer'
		WHEN season = 3 THEN 'Fall'
		WHEN season = 4 THEN 'Winter'
		ELSE 'Unknown'
    END AS season_name,
    ROUND(AVG(count), 0) AS RENTALS
FROM bike_rental_1
GROUP BY season_name 
ORDER BY  RENTALS DESC;


-- Q4 Demand by weather 


SELECT
    CASE
        WHEN weather = 1  THEN 'Clear/Good Weather'
			WHEN weather = 2  THEN 'Cloudy/Misty'
			WHEN weather = 3  THEN 'Light Rain/Snow'
			WHEN weather = 4  THEN 'Severe Weather'

		ELSE 'Unknown'
    END AS weathor_condition,
    ROUND(AVG(count), 0) AS RENTALS
FROM bike_rental_1
GROUP BY weathor_condition 
ORDER BY  RENTALS DESC;



-- Q5 Causal v/s Register user by percentages

SELECT
sum(casual) as Total_Causal,
sum(registered) as Total_Registered,
ROUND(sum(casual)*100/sum(count), 1) AS Causal_Percentage,
ROUND(sum(registered)*100/sum(count), 1) AS Registered_Percentage
FROM bike_rental_1 ;
