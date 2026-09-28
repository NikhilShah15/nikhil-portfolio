# Olist Brazilian E-Commerce Analytics

## Customer, Sales & Operational Performance

An end-to-end e-commerce analytics project using the public Olist Brazilian E-Commerce dataset. I used **Python/Pandas, MySQL and Power BI** to analyse product performance, state-level sales, delivery and customer reviews, sales trends, new vs repeated orders, and payment behaviour.

## Business Questions

1. Which product categories are performing best?
2. Which states show the strongest sales performance?
3. Does delivery time relate to customer review scores?
4. How are sales changing over time?
5. How are new and repeated orders changing?
6. What factors are associated with changes in sales and order volume?

## Project Files

### Python
- [Python Analysis Notebook](Python/Olist_Analysis.ipynb)

### SQL
- [SQL Analysis](SQL/Olist_Analysis.sql)

### Reports
- [Business Report](Reports/Olist_Business_Report.md)
- [Technical Project Summary](Reports/Olist_Technical_Project_Summary.md)

### Power BI
The Power BI model and processed tables used for the dashboard are part of the working project setup. The repository currently keeps the analysis notebook, SQL work and report documentation as the primary browsable artifacts.

## Key Findings

- Merchandise sales across the analysed order-item data were approximately **₹13.59M**.
- **Health & Beauty** generated approximately **₹1.26M**, while **Watches & Gifts** generated approximately **₹1.21M**.
- **São Paulo** generated approximately **₹5.20M**, about **38.3%** of merchandise sales in the analysis.
- Average review scores declined from **4.45** for 0–5 day deliveries to **3.35** for 25–29.145 day deliveries.
- Monthly sales reached approximately **₹1.01M in November 2017**.
- Repeated-order volume increased over the observed period, but repeat-order volume alone was not treated as proof of improved retention.
- Sales and order volume usually moved together, but selected periods showed that order value and category composition also matter.

## Tool Roles

**Python / Pandas** — exploratory analysis, data-quality investigation, derived analytical fields, delivery/review analysis, category analysis, sales trends and new/repeated order classification.

**SQL / MySQL** — relational analysis, reusable views, aggregations, CTEs and window-function validation.

**Power BI / DAX** — analytical data model, measures, slicers and the five-page business dashboard.

## Workflow

**Business Problem → Python Analysis → SQL Validation → Power BI → Insights → Recommendations**

## Portfolio

[Back to Nikhil's Data Analytics Portfolio](https://nikhilshah15.github.io/portfolio/)
