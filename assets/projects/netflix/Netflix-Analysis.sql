CREATE DATABASE  Netflix_db;
USE Netflix_db ; 

show tables ;

select * from netflix_users ;

-- Q] Find Total USers 

SELECT count(*) as Total_Users
FROM netflix_users ;
-- Q] Users who have Accoutn statius active

SELECT count(*) as Active_Users
FROM netflix_users 
WHERE Account_Status = 'Active';


-- Q] Find Users by subcription plan

SELECT Subscription_Plan , count(*)  as Users
FROM netflix_users
GROUP BY Subscription_Plan
ORDER by  Users ;

-- Q] Revenue by Subscription_Plan 

SELECT Subscription_Plan,
SUM(Customer_Revenue) as REVENUE
FROM netflix_users
GROUP BY Subscription_Plan
ORDER BY REVENUE DESC ;

-- Q] Popular Geners

SELECT Genre , count(*) as Views
FROM netflix_users
GROUP BY Genre
Order by Views desc;


-- Q] Country-wise Users

SELECT Country,count(*) as Users
FROM netflix_users
GROUP BY Country
ORDER BY Users DESC ;

-- Q] Device Usage

SELECT Device , count(*) as Users
FROM netflix_users
GROUP BY Device 
ORDER BY Users DESC ;


-- Q] Average Watch Hours by Plan

SELECT Subscription_Plan , 
 ROUND(avg(Watch_Hours),1) as c
 FROM netflix_users
 GROUP BY Subscription_Plan 
 ORDER BY Subscription_Plan DESC ;
 
 -- Q] Top 10 ussers by revenue 
 
 SELECT Customer_Name , Customer_Revenue
 FROM netflix_users
 ORDER BY Customer_Revenue DESC
 LIMIT 10 ;
 
 
 -- Q] Movie v/s Show
 
 SELECT Content_Type, count(*) as Total
 FROM netflix_users 
 GROUP BY Content_Type 
 ORDER BY Total DESC;
 
 
 -- Q ] Avg Rating by Genre
 
 SELECT Genre, round(AVG(Avg_Rating),1) as Avg_Rating
 FROM  netflix_users
 Group by Genre 
 order by Avg_Rating DESC;
 
 -- Q] Account_Status
 
 SELECT Account_Status, count(*) as Users
 From netflix_users
 GROUP BY Account_Status;