create database o_list;
use o_list ;

USE o_list;

SHOW TABLES;
-- Q1 -- 
SELECT *
FROM olist_orders_dataset;

SELECT COUNT(*)
FROM olist_order_items_dataset;

SELECT COUNT(*)
FROM olist_products_dataset;


SELECT *
FROM olist_products_dataset;

SELECT COUNT(DISTINCT product_id) AS unique_products
FROM olist_products_dataset;


SELECT *
FROM product_category_name_translation;


--  Joinning two tables  below to explore on both and joiining them temporirly

select *
from  olist_order_items_dataset oi
join  olist_products_dataset p 
    on oi.product_id = p.product_id ;
    
DESCRIBE product_category_name_translation;
SELECT *
FROM olist_products_dataset p
JOIN product_category_name_translation cn
    ON p.product_category_name = cn.ï»¿product_category_name ;


CREATE VIEW category_sales_data AS
SELECT
    oi.order_id,
    oi.product_id,
    oi.price,
    cn.product_category_name_english
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
JOIN product_category_name_translation cn
    ON p.product_category_name = cn.`ï»¿product_category_name`;
    
select *
from category_sales_data ;

select product_category_name_english ,
round (sum(price), 2) as total_sales,
 Count(*) as items_sold,
round (sum(price)/count(*), 2 )as avg_item_sales
from category_sales_data
group by product_category_name_english
order by total_sales  Desc
limit 10
;

select product_category_name_english ,
round (sum(price), 2) as total_sales,
 Count(*) as items_sold,
round (sum(price)/count(*), 2 )as avg_item_sales,
round(sum(price) / count(distinct order_id),2) as avg_sales_per_order
from category_sales_data
group by product_category_name_english
order by total_sales  Desc
limit 10
;

-- Q2 -- 

SELECT *
FROM olist_customers_dataset;



CREATE VIEW state_sales_data AS
SELECT
    c.customer_state,
    o.order_id,
    oi.price
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id;
    
  -- How much sales value did each customer state generate?
  
select customer_state , round(sum(price),2) as total_sales
from state_sales_data
group by customer_state 
order by total_sales desc 
limit 10;

-- Are the highest-sales states also generating high sales per order? 

select customer_state , 
round(sum(price),2) as total_sales,
count(distinct order_id) as orders
from state_sales_data
group by customer_state 
order by total_sales desc 
limit 10;

-- Average sales per order by state ?

select customer_state , 
round(sum(price),2) as total_sales,
count(distinct order_id) as orders,
round(sum(price) / count(distinct order_id),2) as avg_sales_per_order
from state_sales_data
group by customer_state 
order by total_sales desc 
limit 10;

-- Q3 -- 
'''
-- Does delivery time relate to customer reviews?


SELECT *
FROM olist_order_reviews_dataset;

DROP VIEW IF EXISTS state_delivery_review_data;

DROP VIEW IF EXISTS state_delivery_review_data;

CREATE VIEW state_delivery_review_data AS
SELECT
    c.customer_state,
    o.order_id,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    r.review_score
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
JOIN olist_order_reviews_dataset r
    ON o.order_id = r.order_id;
    
SELECT *
FROM state_delivery_review_data
LIMIT 5;

-- Check the timestamps

SELECT
    customer_state,
    order_id,
    order_purchase_timestamp,
    order_delivered_customer_date,

    STR_TO_DATE(
        order_purchase_timestamp,
        '%m/%d/%Y %H:%i'
    ) AS purchase_datetime,

    STR_TO_DATE(
        order_delivered_customer_date,
        '%m/%d/%Y %H:%i'
    ) AS delivery_datetime,

    review_score

FROM state_delivery_review_data
LIMIT 5;


--  Calculate delivery days

SELECT
    customer_state,
    order_id,

    ROUND(
        TIMESTAMPDIFF(
            MINUTE,
            STR_TO_DATE(
                order_purchase_timestamp,
                '%m/%d/%Y %H:%i'
            ),
            STR_TO_DATE(
                order_delivered_customer_date,
                '%m/%d/%Y %H:%i'
            )
        ) / 1440,
        2
    ) AS delivery_days,

    review_score

FROM state_delivery_review_data

WHERE order_delivered_customer_date IS NOT NULL

LIMIT 10;



-- Check the delivery-day results

SELECT
    MIN(
        TIMESTAMPDIFF(
            MINUTE,
            STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i'),
            STR_TO_DATE(order_delivered_customer_date, '%m/%d/%Y %H:%i')
        ) / 1440
    ) AS min_delivery_days,

    MAX(
        TIMESTAMPDIFF(
            MINUTE,
            STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i'),
            STR_TO_DATE(order_delivered_customer_date, '%m/%d/%Y %H:%i')
        ) / 1440
    ) AS max_delivery_days

FROM state_delivery_review_data

WHERE order_delivered_customer_date IS NOT NULL;

-- Calculate the state-level analysis


SELECT
    customer_state,

    ROUND(
        AVG(
            TIMESTAMPDIFF(
                MINUTE,
                STR_TO_DATE(
                    order_purchase_timestamp,
                    '%m/%d/%Y %H:%i'
                ),
                STR_TO_DATE(
                    order_delivered_customer_date,
                    '%m/%d/%Y %H:%i'
                )
            ) / 1440
        ),
        2
    ) AS avg_delivery_days,

    ROUND(
        AVG(review_score),
        2
    ) AS avg_review_score,

    COUNT(DISTINCT order_id) AS reviewed_orders

FROM state_delivery_review_data

WHERE order_delivered_customer_date IS NOT NULL

GROUP BY customer_state

ORDER BY avg_delivery_days DESC;

-- Make the result easier to analyze


SELECT
    customer_state,

    ROUND(
        AVG(
            TIMESTAMPDIFF(
                MINUTE,
                STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i'),
                STR_TO_DATE(order_delivered_customer_date, '%m/%d/%Y %H:%i')
            ) / 1440
        ),
        2
    ) AS avg_delivery_days,

    ROUND(AVG(review_score), 2) AS avg_review_score,

    COUNT(DISTINCT order_id) AS reviewed_orders

FROM state_delivery_review_data

WHERE order_delivered_customer_date IS NOT NULL

GROUP BY customer_state

ORDER BY avg_delivery_days DESC;


SELECT COUNT(*) AS total_rows
FROM state_delivery_review_data;

SELECT COUNT(*) AS review_rows
FROM olist_order_reviews_dataset;
SELECT COUNT(DISTINCT order_id) AS unique_reviewed_orders
FROM olist_order_reviews_dataset;
SELECT *
FROM olist_order_reviews_dataset
LIMIT 10;


SELECT COUNT(*) AS total_reviews
FROM olist_order_reviews_dataset;
'''

 -- Q3  -- Sales over time 
 
 show tables ;
CREATE VIEW monthly_sales_data AS
SELECT
    o.order_purchase_timestamp,
    o.order_id,
    oi.price
FROM olist_order_items_dataset oi
JOIN olist_orders_dataset o
    ON oi.order_id = o.order_id ;

DESCRIBE monthly_sales_data;

SELECT 
    order_purchase_timestamp,
    price,
    DATE_FORMAT(
        STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i'),
        '%Y-%m'
    ) AS purchase_month
FROM monthly_sales_data;


--  Calculate monthly sales

select *
from monthly_sales_data ;


With CTE as (
SELECT 
    order_purchase_timestamp,
    price,
    DATE_FORMAT(
        STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i'),
        '%Y-%m'
    ) AS purchase_month
FROM monthly_sales_data
) 
select purchase_month, 
round(sum(price), 2) as Total_sales 
from CTE 
group by purchase_month
order by purchase_month
  ;


-- Top 5 month by sales 


With CTE as (
SELECT 
    order_purchase_timestamp,
    price,
    DATE_FORMAT(
        STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i'),
        '%Y-%m'
    ) AS purchase_month
FROM monthly_sales_data
) 
select purchase_month, 
round(sum(price), 2) as Total_sales 
from CTE 
group by purchase_month
order by Total_sales DESC
limit 5  ;

-- Q4 -- The proportion of orders coming from new vs repeat customers.

show tables ;

create view orders_customers as 
select 
order_purchase_timestamp,
customer_unique_id
from olist_orders_dataset o  
 join olist_customers_dataset c 
 on o.customer_id = c.customer_id ;
  
  --  customer and their purchase ranks means we can seperate based on rank when did first purchase happened
  
select
    order_purchase_timestamp,
    customer_unique_id,
    row_number() over(
    partition by customer_unique_id
    order by STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i')
     ) as purchase_rank
FROM orders_customers;
 
 -- seperating the first purchase of each customer
 
 With CTE1 as ( 
 select
    order_purchase_timestamp,
    customer_unique_id,
    row_number() over(
    partition by customer_unique_id
    order by STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i')
     ) as purchase_rank
from orders_customers 
)
 select
 customer_unique_id,
 order_purchase_timestamp,
 purchase_rank
 from CTE1 
 where purchase_rank = 1 ;
 

 -- segregating type as new or repeated 
 
With CTE1 as ( 
 select
    order_purchase_timestamp,
    customer_unique_id,
    row_number() over(
    partition by customer_unique_id
    order by STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i')
     ) as purchase_rank
from orders_customers 
)
 select
    customer_unique_id,
    order_purchase_timestamp,
    purchase_rank,
   case 
      when purchase_rank = 1 then 'New'
      else 'Repeated'
	end as order_type

from CTE1 ;

-- we need puchase month now so adding new column

With CTE1 as ( 
 select
    order_purchase_timestamp,
    customer_unique_id,
    row_number() over(
    partition by customer_unique_id
    order by STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i')
     ) as purchase_rank
from orders_customers 
)
 select
    customer_unique_id,
    order_purchase_timestamp,
    purchase_rank,
      date_format(
        str_to_date(
            order_purchase_timestamp, '%m/%d/%Y %H:%i'
        ),
        '%Y-%m'
    ) AS purchase_month,
   case 
      when purchase_rank = 1 then 'New'
      else 'Repeated'
	end as order_type

from CTE1 ;
 
 -- now we need coun of total order so we cna then make percentage of it so
 
 With CTE1 as ( 
 select
    order_purchase_timestamp,
    customer_unique_id,
    row_number() over(
    partition by customer_unique_id
    order by STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i')
     ) as purchase_rank
from orders_customers 
),
CTE2 as (
 select
    customer_unique_id,
    order_purchase_timestamp,
    purchase_rank,
      date_format(
        str_to_date(
            order_purchase_timestamp, '%m/%d/%Y %H:%i'
        ),
        '%Y-%m'
    ) AS purchase_month,
   case 
      when purchase_rank = 1 then 'New'
      else 'Repeated'
	end as order_type
from CTE1 
)
select 
  purchase_month,
  order_type,
  count(*) as order_count
from CTE2
group by purchase_month,order_type
order by purchase_month,order_type ;

-- now doing % of new and repeated orders

With CTE1 as ( 
 select
    order_purchase_timestamp,
    customer_unique_id,
    row_number() over(
    partition by customer_unique_id
    order by STR_TO_DATE(order_purchase_timestamp, '%m/%d/%Y %H:%i')
     ) as purchase_rank
from orders_customers 
),
CTE2 as (
 select
    customer_unique_id,
    order_purchase_timestamp,
    purchase_rank,
      date_format(
        str_to_date(
            order_purchase_timestamp, '%m/%d/%Y %H:%i'
        ),
        '%Y-%m'
    ) AS purchase_month,
   case 
      when purchase_rank = 1 then 'New'
      else 'Repeated'
	end as order_type
from CTE1 
),
CTE3 as (
select 
  purchase_month,
  order_type,
  count(*) as order_count
from CTE2
group by purchase_month,order_type
order by purchase_month,order_type
) 
SELECT
    purchase_month,
    SUM(CASE WHEN order_type = 'New' THEN order_count ELSE 0 END) AS new_orders,
    SUM(CASE WHEN order_type = 'Repeat' THEN order_count ELSE 0 END) AS repeat_orders,
    ROUND(
        SUM(CASE WHEN order_type = 'New' THEN order_count ELSE 0 END)
        / SUM(order_count) * 100,
        2
    ) AS new_order_percentage,
    ROUND(
        SUM(CASE WHEN order_type = 'Repeated' THEN order_count ELSE 0 END)
        / SUM(order_count) * 100,
        2
    ) AS repeat_order_percentage
FROM CTE3
GROUP BY purchase_month
ORDER BY purchase_month;
    
SELECT
    customer_unique_id,
    COUNT(*) AS order_count
FROM orders_customers
GROUP BY customer_unique_id
HAVING COUNT(*) > 1
ORDER BY order_count DESC;