# Olist Brazilian E-Commerce Analytics

### Customer, Sales & Operational Performance

An end-to-end business analysis of the **Olist Brazilian E-Commerce public dataset**, focused on understanding product performance, geographic sales, delivery experience, customer ordering behavior, sales trends and payment activity.

## Business Objective

The analysis was undertaken to answer six business questions:

1. Which product categories are performing best?
2. Which states show the strongest sales performance?
3. Does delivery time relate to customer review scores?
4. How are sales changing over time?
5. How are new and repeated orders changing?
6. What factors are associated with changes in sales and order volume?

## Key Business Findings

### 1. Category Performance

**Health & Beauty** generated approximately **₹1.26M** in merchandise sales, followed by **Watches & Gifts at ₹1.21M** and **Bed Bath & Table at ₹1.04M**.

The complete analyzed dataset generated approximately **₹13.59M** in merchandise sales.

Category performance is not driven by sales volume alone. Different categories reach similar sales levels through different combinations of item volume and item value.

### 2. Geographic Sales Performance

**São Paulo** generated approximately **₹5.20M** in sales and had the largest order base.

However, the state with the largest total sales is not necessarily the state with the highest average sales per order. Geographic performance therefore needs to be evaluated using both **market scale and order value**.

### 3. Delivery Experience & Customer Reviews

Average review scores declined as delivery time increased:

| Delivery Time | Average Review Score |
|---|---:|
| 0–5 days | 4.45 |
| 25–29.145 days | 3.35 |

The negative pattern remained after extreme delivery observations were excluded.

This identifies longer-delivery segments as an important area for operational investigation.

### 4. Sales Trends

Sales and order volume do not always move together.

For example, there were periods where the number of orders decreased while sales increased, and periods where orders increased while sales decreased.

This shows why **average order value and sales composition** should be monitored alongside order volume.

### 5. New & Repeated Orders

Repeated-order activity increased substantially across the observed period.

Repeated orders increased from **36 in January 2017 to 277 in February 2018**, while new customers continued to represent the majority of monthly orders.

Increasing repeat-order activity is an important customer-behavior signal, but it should not automatically be interpreted as proven customer retention.

### 6. Payment & Operational Monitoring

The analysis also examined payment behavior, including payment methods, installments, payment values and multiple-payment orders.

These measures provide additional context when investigating changes in sales and order activity.

## Business Recommendations

1. Monitor category performance using **sales, item volume and average item value together**.
2. Investigate the operational drivers behind **long delivery times**.
3. Evaluate states using both **total sales and average sales per order**.
4. Monitor **sales, order volume and average order value** together when assessing growth or decline.
5. Develop **cohort-based retention metrics** to measure repeat customer behavior more rigorously.
6. Monitor payment behavior and unusual movements in sales or order volume before making operational decisions.

## Power BI Dashboard

The final Power BI dashboard provides an interactive view of the project's business analysis across products, sales, customers, geography, delivery experience and payments.

**[View / Download Power BI Dashboard (.pbix)](https://drive.google.com/file/d/1MKdVmuZ5XEdy-tEu9iVuPNwPeUfFf9N1/view?usp=sharing)**

## Project Files

| Resource | Link |
|---|---|
| Business Report | [View Business Report](Reports/Olist_Ecommerce_Analysis_Report.pdf) |
| Technical Project Summary | [View Technical Summary](Reports/Olist_Ecommerce_Technical_Project_Summary.pdf) |
| Python Analysis | [Open Python Analysis](Python/Olist_Ecommerce_Analysis.ipynb) |
| SQL Analysis | [Open SQL Analysis](SQL/Olist_Ecommerce_Analysis.sql) |
| Power BI Data | [View Power BI Data Files](PowerBI/) |
| Project Visuals | [View Project Visuals](Visuals/) |

## Analysis Workflow

**Business Questions → Data Analysis → Findings → Business Insights → Recommendations → Power BI Dashboard**

## Conclusion

The analysis provides an overall view of Olist's sales performance, customer behavior, product categories, geographic markets, delivery experience and payment activity.

The findings show that strong performance can come from different combinations of sales volume and value, longer delivery times are associated with lower review scores, repeat-order activity is increasing, and sales movement cannot be understood from order volume alone.

The accompanying Power BI dashboard turns these findings into an interactive view that can be used to monitor performance and investigate areas requiring further attention.
