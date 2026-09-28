# OLIST BRAZILIAN E-COMMERCE ANALYTICS

### Customer, Sales & Operational Performance

**Prepared by Nikhil Shah**

---

## Project Files

| Resource | Link |
|---|---|
| Business Report | [View Business Report](Reports/Olist_Ecommerce_Analysis_Report.pdf) |
| Power BI Dashboard | [View / Download Power BI Dashboard (.pbix)](https://drive.google.com/file/d/1MKdVmuZ5XEdy-tEu9iVuPNwPeUfFf9N1/view?usp=sharing) |
| Python Analysis | [Open Python Analysis](Python/Olist_Ecommerce_Analysis.ipynb) |
| SQL Analysis | [Open SQL Analysis](SQL/Olist_Ecommerce_Analysis.sql) |
| Customers Data | [Open CSV](PowerBI/Customers_PowerBI.csv) |
| Delivery & Reviews Data | [Open CSV](PowerBI/Delivery_Reviews_PowerBI.csv) |
| Order Items Data | [Open CSV](PowerBI/Order_Items_PowerBI.csv) |
| Orders Data | [Open CSV](PowerBI/Orders_PowerBI.csv) |
| Payment Summary Data | [Open CSV](PowerBI/Payment_Summary_PowerBI.csv) |
| Payments Data | [Open CSV](PowerBI/Payments_PowerBI.csv) |

**Analysis Workflow:** Business Questions → Data Analysis → Findings → Business Insights → Recommendations → Power BI Dashboard

---

## 1. Executive Summary

### Business Context

Olist operates an e-commerce marketplace where business performance depends on product demand, customer purchasing behavior, geographic markets and the delivery experience.

The purpose of this analysis is to identify the major patterns affecting commercial performance and customer experience and translate them into decisions that can improve how the marketplace is monitored and managed.

### What the Analysis Found

The analysis identified five major themes.

**Category performance is driven by different sales mechanisms.**

Health & Beauty generated approximately ₹1.26M in merchandise sales, while Watches & Gifts generated approximately ₹1.21M. However, the categories achieve similar sales through different combinations of item volume and item value. This means category performance should not be evaluated through sales alone.

**Delivery experience is closely associated with customer feedback.**

Average review scores decline from 4.45 for deliveries completed within 0–5 days to 3.35 for deliveries between 25–29.145 days. The pattern remains negative after extreme delivery observations are excluded. Long-delivery segments therefore represent an important area for operational investigation.

**The largest sales market is not necessarily the highest-value market per order.**

São Paulo generates approximately ₹5.20M in sales and has the largest order base, while states such as Bahia record higher average sales per order. Geographic decisions therefore require both market scale and order-value perspectives.

**Sales growth cannot be understood from order volume alone.**

There are periods where sales increase despite fewer orders and periods where orders increase while sales decline. Average order value therefore provides important context for understanding changes in revenue.

**Repeated purchasing is increasing, but repeat orders should not automatically be interpreted as retention.**

Repeated-order volume rises substantially across the observed period. This creates a clear opportunity to develop more formal cohort-based retention measurement.

### Recommended Business Actions

1. Monitor category performance using sales, item volume and average item value together.
2. Investigate the operational drivers of long delivery times.
3. Evaluate states using both total sales and average sales per order.
4. Monitor sales, order volume and average order value together.
5. Develop cohort-based retention metrics to measure repeat customer behavior more rigorously.

---

## 2. Business Objective

The analysis was undertaken to answer six business questions:

1. Which product categories are performing best?
2. Which states show the strongest sales performance?
3. Does delivery time relate to customer review scores?
4. How are sales changing over time?
5. How are new and repeated orders changing?
6. What factors are associated with changes in sales and order volume?

These questions form the complete analytical backbone of the project.

---

## 3. Business Questions

### Question 1

**Which product categories are performing best?**

#### Problem

The business needs to understand which product categories contribute most to sales and whether strong performance is driven by high purchase volume, higher product value, or both. This is important because inventory and promotional decisions should reflect how each category actually generates revenue.

#### Answer

Health & Beauty is the highest-performing category by total sales, generating approximately ₹1.26M. It is followed by Watches & Gifts at ₹1.21M and Bed Bath & Table at ₹1.04M.

The complete dataset generated approximately ₹13.59M in merchandise sales, so Health & Beauty alone contributed about 9.3% of total sales, while Watches & Gifts contributed about 8.9%.

However, the sales leaders are not performing in the same way. Bed Bath & Table sold the highest number of items at 11,115, while Watches & Gifts sold 5,991 items but had an average item price of approximately ₹201, compared with about ₹93 for Bed Bath & Table.

#### Analysis

Category performance was analyzed using total sales, items sold, average item price, and average sales per order.

Health & Beauty generated ₹1.26M from 9,670 items, making it the largest contributor to category sales.

Watches & Gifts generated ₹1.21M from 5,991 items. Although it sold about 3,679 fewer items than Health & Beauty, its higher item value allowed it to generate almost the same level of sales.

Bed Bath & Table generated ₹1.04M, but achieved this through the highest item volume of 11,115 items. Its average item price was approximately ₹93, substantially lower than Watches & Gifts.

This demonstrates that category performance is driven by different combinations of volume and value rather than one common factor.

#### Insight

**Observation:** Health & Beauty generated the highest sales at ₹1.26M, while Bed Bath & Table generated the highest item volume at 11,115 and Watches & Gifts generated ₹1.21M despite selling only 5,991 items.

**Reason:** Health & Beauty combines strong demand with meaningful item value, Bed Bath & Table relies more heavily on sales volume, while Watches & Gifts generates substantial revenue from higher-value products.

**Impact:** Managing all three categories using the same inventory or promotional strategy could miss the reason each category is contributing strongly to revenue.

#### Recommendation

- Prioritize inventory availability for Health & Beauty, because its ₹1.26M contribution makes it the largest category-level revenue source.
- For Bed Bath & Table, identify the highest-selling products within the 11,115 items sold and prioritize their stock availability, because the category's performance is strongly volume-driven.
- For Watches & Gifts, identify the products responsible for the category's higher item value and prioritize their availability and relevant promotions, rather than focusing only on increasing unit volume.
- Use the top-selling SKUs within each major category as the operational inventory and promotion list instead of applying one strategy to the entire category.

---

### Question 2

**Which states show the strongest sales performance?**

#### Problem

The business operates across multiple states, but sales are not distributed evenly. Understanding where revenue is concentrated and where customers generate higher order values can help determine how different markets should be managed.

#### Answer

São Paulo (SP) is the strongest state by total sales, generating approximately ₹5.20M from 41,375 orders.

This represents roughly 38.3% of the ₹13.59M total merchandise sales in the analysis.

São Paulo is also substantially ahead of the next-largest states: Rio de Janeiro generated ₹1.82M and Minas Gerais generated ₹1.59M.

However, São Paulo does not have the highest average sales per order. Bahia recorded approximately ₹152.28 per order, compared with ₹125.75 in São Paulo.

Therefore, São Paulo is the largest market by scale, while some smaller states generate greater value per order.

#### Analysis

State performance was evaluated using total sales, order count, and average sales per order.

São Paulo recorded approximately 41,375 orders, compared with 12,762 in Rio de Janeiro and 11,544 in Minas Gerais.

Its ₹5.20M sales therefore come from a very large order base.

The average-sales-per-order analysis gives a different perspective. Bahia generated approximately ₹152.28 per order, while Santa Catarina generated ₹144.12 and Goiás ₹146.78.

This means a state can have lower total sales while still showing stronger customer spending on an individual order.

#### Insight

**Observation:** São Paulo generated ₹5.20M, approximately 38.3% of total merchandise sales, while Bahia generated a higher average sales per order of ₹152.28 compared with São Paulo's ₹125.75.

**Reason:** São Paulo's overall sales leadership is primarily associated with its much larger order volume, whereas some smaller markets generate more value from each order.

**Impact:** Geographic performance should not be evaluated only by total sales. A high-volume market and a high-order-value market present different operational opportunities.

#### Recommendation

- Protect São Paulo's existing sales base by prioritizing availability of the products and categories already generating the highest sales in the state.
- For Bahia, Santa Catarina, and Goiás, identify the categories and products behind their higher average order values and use those products for targeted promotions and availability planning.
- Use a volume-focused strategy in São Paulo, where maintaining availability across high-demand products can protect a ₹5.20M sales base.
- Use a basket-value strategy in higher-value states, focusing on products that are already generating larger orders.
- Before increasing inventory or promotional spending in a state, identify its top-selling products and categories so investment is directed toward demonstrated demand.

---

### Question 3

**Does delivery time relate to customer review scores?**

#### Problem

Delivery performance is an important part of the customer experience. The business needs to understand whether longer delivery times are associated with lower customer satisfaction and where delivery performance requires attention.

#### Answer

Yes. Longer delivery times are associated with progressively lower average review scores.

The average review score falls from 4.45 for orders delivered within 0–5 days to 3.35 for orders taking 25–29.145 days.

That is a 1.10-point difference in average review score.

The relationship is also reflected in the correlation analysis: the overall correlation was approximately -0.33. After excluding delivery-time values above the calculated outlier boundary of 29.145 days, the correlation weakened to approximately -0.17.

This means unusually long deliveries contribute to the overall relationship, but the downward pattern remains across the normal analyzed delivery ranges.

#### Analysis

Delivery time was calculated from the order purchase timestamp to the actual customer delivery date.

Across the analyzed delivered orders:

- Mean delivery time: 12.56 days
- Median delivery time: 10.22 days
- 75% of orders were delivered within approximately 15.72 days
- 90% were delivered within approximately 23.10 days

Orders were then grouped into delivery-time buckets and compared with their average review scores.

The pattern was consistent:

- 0–5 days → 4.45
- 5–10 days → 4.36
- 10–15 days → 4.27
- 15–20 days → 4.13
- 20–25 days → 3.87
- 25–29.145 days → 3.35

The analysis therefore shows a clear downward association between longer delivery times and customer review scores.

#### Insight

**Observation:** Average review scores decline from 4.45 in the 0–5 day range to 3.35 in the 25–29.145 day range.

**Reason:** The data shows a consistent association between longer delivery times and lower customer ratings. However, delivery time is not the only factor that can influence a customer's review.

**Impact:** Long-delivery orders represent a customer-experience risk. The difference between 4.45 and 3.35 suggests that the highest-delay orders deserve operational attention.

#### Recommendation

- Create an operational exception list for orders approaching or exceeding 20 days, because review scores fall to approximately 3.87 in the 20–25 day range and 3.35 in the 25–29.145 day range.
- Break those delayed orders down by state, seller, and product category to identify where the delays are concentrated.
- Prioritize intervention for segments showing both high delivery time and low review scores rather than treating every delayed order equally.
- Track delivery time and review score together as customer-experience KPIs.
- After interventions are introduced, compare the number of long-delivery orders and average review scores over time to determine whether the operational changes are improving the customer experience.

---

### Question 4

**How are sales changing over time?**

#### Problem

The business needs to understand its sales trajectory, identify periods of strong performance, and determine whether changes in revenue are driven only by order volume or also by the value and composition of orders.

#### Answer

Sales show a strong upward trend through 2017, followed by consistently high monthly sales during the available 2018 period.

Monthly sales increased from approximately ₹120K in January 2017 to ₹664K in October 2017, before reaching the highest recorded month of approximately ₹1.01M in November 2017.

Sales remained close to the ₹1M level in several 2018 months:

- March 2018: ₹983K
- April 2018: ₹997K
- May 2018: ₹997K

The beginning and end of the dataset contain partial months, so these should not be interpreted as normal full-month sales declines.

#### Analysis

Monthly sales were calculated using merchandise prices from order items and the purchase month of each order.

The dataset shows substantial growth during 2017. Sales increased from ₹120K in January to ₹247K in February, ₹374K in March, and ₹506K in May.

Sales continued increasing through much of the year, reaching ₹574K in August, ₹624K in September, and ₹664K in October.

November 2017 then reached approximately ₹1.01M, the highest monthly sales value in the dataset.

Sales remained strong in 2018, with several months close to ₹1M.

However, sales and order volume did not always move together. From August to September 2017, orders fell slightly from 4,331 to 4,285, while sales increased by approximately ₹50.4K.

#### Insight

**Observation:** Monthly sales increased from ₹120K in January 2017 to ₹1.01M in November 2017 and remained close to ₹1M in several 2018 months.

**Reason:** Sales generally move with order volume, but periods such as August–September 2017 show that changes in order value and category composition can also increase revenue even when the number of orders falls.

**Impact:** The business should not use order count alone to judge sales performance. Revenue can increase through higher-value orders even without an increase in order volume.

#### Recommendation

- Monitor total sales, order volume, and average sales per order together each month.
- When sales rise while order volume falls, identify the categories and products generating the higher-value orders and protect their availability.
- When order volume rises but sales fall, investigate whether customers are shifting toward lower-value products or categories.
- Compare the category mix of strong and weak months to identify which categories are responsible for meaningful revenue changes.
- Use high-performing periods such as November 2017's ₹1.01M as benchmarks for understanding what category and order-value combinations supported stronger sales.

---

### Question 5

**How are new and repeated orders changing?**

#### Problem

Order growth can come from acquiring new customers or encouraging existing customers to purchase again. The business needs to understand how these two sources of orders are changing over time.

#### Answer

Repeated-order volume increased substantially over the observed period, while new customers continued to represent the majority of monthly orders.

Repeated orders increased from just 36 in January 2017 to 104 in May, 155 in September, and 240 in November 2017.

The increase continued into 2018, reaching 244 repeated orders in January and 277 in February 2018.

This shows increasing repeat-order activity, but the analysis does not prove that overall customer retention improved because repeat-order volume can also rise as the overall customer base becomes larger.

#### Analysis

Customer purchase history was analyzed using customer_unique_id to identify whether an order belonged to a customer's first purchase or a subsequent purchase.

Each customer's earliest purchase was identified and later orders from the same customer were classified as repeated orders.

The number of repeated orders increased considerably:

- January 2017 → 36
- May 2017 → 104
- September 2017 → 155
- November 2017 → 240
- January 2018 → 244
- February 2018 → 277

At the same time, new customers remained the larger source of monthly orders.

For example, in August 2017 there were 4,184 new orders and 147 repeated orders, meaning repeated orders represented approximately 3.4% of the 4,331 total orders that month.

#### Insight

**Observation:** Repeated orders increased from 36 in January 2017 to 277 in February 2018, but new customers continued to generate the majority of orders.

**Reason:** The marketplace is receiving orders from both newly acquired customers and customers returning after a previous purchase. The growing number of repeated orders indicates increasing repeat-purchase activity, although it does not by itself establish a higher retention rate.

**Impact:** The business has two sources of order growth: continued customer acquisition and repeat purchasing. Understanding both is necessary for sustainable customer growth.

#### Recommendation

- Separate acquisition and retention strategies instead of treating all customers as one group.
- For existing customers, analyze their previous product and category purchases and use those patterns to create relevant follow-up offers, cross-selling opportunities, or replenishment reminders.
- Identify categories with stronger repeat purchasing and prioritize those categories for retention campaigns.
- Track repeat-customer rate in addition to repeat-order volume, so growth is measured based on customer behavior rather than order count alone.
- Measure whether customers exposed to retention actions actually return for another purchase and use that result to refine future campaigns.

---

### Question 6

**What factors are associated with changes in sales and order volume?**

#### Problem

Sales and order volume generally move together, but not always. The business needs to understand what is happening when revenue and order volume move in different directions so that the correct operational response can be taken.

#### Answer

Order volume is an important factor associated with sales, but it does not fully explain revenue changes.

Most months show sales and order volume moving together, but several periods demonstrate the importance of order value and category composition:

- From August to September 2017, orders decreased by 46, from 4,331 to 4,285, while sales increased by approximately ₹50.4K.
- From March to April 2018, orders decreased by 272, from 7,211 to 6,939, while sales increased by approximately ₹13.4K.
- From July to August 2018, orders increased by 220, from 6,292 to 6,512, while sales decreased by approximately ₹40.8K.

These examples demonstrate that more orders do not always mean more sales, and fewer orders do not always mean lower sales.

#### Analysis

Monthly sales and order volume were compared to identify whether both measures moved in the same direction.

Most months showed a positive relationship between sales and orders, indicating that order volume is an important component of revenue performance.

However, the exceptions provide important business information.

In August–September 2017, the business received 46 fewer orders but generated ₹50.4K more sales. This means the value generated per order increased.

Similarly, March–April 2018 saw 272 fewer orders but ₹13.4K higher sales.

The opposite pattern occurred in July–August 2018: orders increased by 220, but sales fell by approximately ₹40.8K.

Category-level analysis of these periods showed that several major categories remained among the top contributors, while their individual sales values changed. Therefore, the composition and value of orders matter alongside order volume.

#### Insight

**Observation:** Sales and order volume generally move together, but the August–September 2017, March–April 2018, and July–August 2018 periods show that the two measures can move in opposite directions.

**Reason:** Changes in average order value and category-level sales can offset changes in order volume. A smaller number of higher-value orders can generate more revenue, while a larger number of lower-value orders can generate less.

**Impact:** Looking only at order volume can lead to an incorrect interpretation of revenue performance and potentially result in the wrong business action.

#### Recommendation

- Monitor total sales, order volume, and average sales per order together as the core monthly revenue indicators.
- When orders increase but sales decrease, identify the categories and products responsible for the lower-value orders and check whether high-value categories are losing sales share.
- When orders decrease but sales increase, identify the products and categories responsible for the higher-value orders and protect their inventory availability.
- For significant month-to-month changes, compare the top category and product mix before deciding whether the appropriate response is inventory, promotion, or category-level intervention.
- Use the analysis to distinguish between three situations: insufficient demand volume, lower order value, or changing category mix. Each requires a different action rather than automatically increasing promotions or inventory.

---

## 4. Consolidated Business Recommendations

### 4.1 Protect High-Value Revenue Sources

The analysis shows that ₹13.59M in merchandise sales were generated across the dataset, with Health & Beauty contributing ₹1.26M (9.3%) and São Paulo contributing ₹5.20M (38.3%) of total sales. These areas represent significant existing revenue sources.

**Action:** Maintain strong inventory availability for the highest-selling products in Health & Beauty and in São Paulo. Product-level stock planning should prioritize items that already demonstrate strong sales rather than distributing inventory equally across all products and markets.

### 4.2 Manage Categories According to How They Generate Revenue

The category analysis showed different performance patterns. Bed Bath & Table sold 11,115 items, the highest volume, while Watches & Gifts generated ₹1.21M from 5,991 items, supported by a much higher average item value.

**Action:** Use different category strategies instead of treating all high-performing categories equally. Maintain stock depth for high-volume categories such as Bed Bath & Table, while protecting availability and targeted promotion of higher-value products within categories such as Watches & Gifts.

### 4.3 Reduce Exposure to Long Delivery Times

Average review scores declined from 4.45 for 0–5 day deliveries to 3.35 for 25–29.145 day deliveries, a difference of 1.10 points.

**Action:** Monitor orders approaching longer delivery ranges, particularly those exceeding approximately 20 days, and investigate the states, sellers, and categories responsible for these delays. The objective should be to reduce the number of severely delayed orders and monitor whether review scores improve alongside delivery performance.

### 4.4 Use Both Customer Acquisition and Repeat Purchasing

Repeated orders increased from 36 in January 2017 to 277 in February 2018, while new customers continued to represent the majority of orders.

**Action:** Maintain customer-acquisition activity while developing a separate retention strategy for existing customers. Use previous purchase categories and products to identify relevant cross-selling, replenishment, or follow-up opportunities, and measure success through repeat-customer behavior rather than repeat-order volume alone.

### 4.5 Monitor Revenue Through Sales, Orders, and Order Value Together

The analysis showed that sales and order volume usually move together, but not always. From July to August 2018, orders increased by 220, while sales decreased by approximately ₹40.8K. Conversely, from August to September 2017, orders decreased by 46, while sales increased by approximately ₹50.4K.

**Action:** Track total sales, order volume, and average sales per order together. When these measures move in different directions, investigate the category and product mix before deciding whether the appropriate response is additional inventory, targeted promotion, or protection of high-value products.

### 4.6 Prioritize Decisions Using Evidence Rather Than Equal Allocation

The analysis shows substantial differences across categories, states, delivery performance, and customer behavior. For example, São Paulo generated ₹5.20M, while Bahia generated a higher average sales value per order of ₹152.28 compared with São Paulo's ₹125.75.

**Action:** Allocate operational attention according to the specific business situation: protect high-volume revenue markets, investigate high-value markets for expansion opportunities, maintain stock for proven high-demand products, and prioritize operational intervention where delivery performance is weakest.

### Overall Business Direction

The analysis indicates that the business should focus on protecting existing high-value revenue, managing products and markets according to their actual sales behavior, reducing exposure to long delivery times, and developing repeat purchasing alongside new-customer acquisition.

The key principle is to avoid treating the entire marketplace in the same way. The data shows that different categories, states, customer groups, and delivery segments behave differently, so operational actions should be targeted according to the evidence.

---

## 5. Dashboard & Decision Support

The Power BI dashboard was developed to convert the analysis into an interactive decision-support tool. The five dashboard pages bring together the key measures identified throughout the analysis, allowing business users to move from overall performance to category, customer, delivery, and payment-level details.

### 5.1 Executive Overview

The **Olist E-Commerce Executive Overview** provides a consolidated view of the business through total sales, total orders, active customers, and average order value.

The dashboard supports the overall finding of approximately **₹13.59M in merchandise sales** across the analyzed order-item data. It also highlights the concentration of sales across categories and states, including **₹1.26M from Health & Beauty** and approximately **₹5.20M from São Paulo**.

The monthly sales trend allows users to observe the increase in sales over time, including the peak of approximately **₹1.01M in November 2017**.

**Business use:** Management can use this page to quickly assess overall business performance and identify the categories, states, and periods contributing most to sales before moving into more detailed analysis.

![Olist E-Commerce Executive Overview](https://raw.githubusercontent.com/NikhilShah15/nikhil-portfolio/main/assets/projects/olist/Visuals/page-1.png)

**Figure 1. Olist E-Commerce Executive Overview — Power BI Dashboard**

### 5.2 Product & Sales Analysis

The **Product & Sales Analysis** page examines category performance through three different measures:

- Total sales
- Items sold
- Average item price

This view reflects the finding that categories generate revenue through different combinations of volume and value.

For example, **Bed Bath & Table sold 11,115 items and generated approximately ₹1.04M**, while **Watches & Gifts generated approximately ₹1.21M from 5,991 items**. Comparing these measures helps explain why two categories with different sales volumes can still generate similar levels of revenue.

**Business use:** Category managers can use the page to identify whether a category requires a **volume-focused or value-focused approach**, supporting more targeted inventory and promotional decisions.

![Olist Product & Sales Analysis](https://raw.githubusercontent.com/NikhilShah15/nikhil-portfolio/main/assets/projects/olist/Visuals/page-2.png)

**Figure 2. Olist Product & Sales Analysis — Power BI Dashboard**

### 5.3 Customer & Order Analysis

The **Customer & Order Analysis** page examines order activity from both customer and time perspectives.

The dashboard separates **new and repeated orders**, allowing users to monitor the same customer-behavior pattern identified in the analysis. Repeated-order volume increased from **36 orders in January 2017 to 277 in February 2018**, while new customers continued to account for the majority of monthly orders.

The page also shows order distribution by **day of the week and customer state**, providing additional ways to identify where order activity is concentrated.

**Business use:** Management can monitor whether order activity is being generated primarily by new or returning customers and identify states or periods where customer-order activity requires further investigation.

![Olist Customer & Order Analysis](https://raw.githubusercontent.com/NikhilShah15/nikhil-portfolio/main/assets/projects/olist/Visuals/page-3.png)

**Figure 3. Olist Customer & Order Analysis — Power BI Dashboard**

### 5.4 Delivery & Customer Experience

The **Delivery & Customer Experience** page connects delivery performance with customer review scores.

The main visualization reflects the relationship identified in the analysis: average review scores declined from **4.45 for deliveries within 0–5 days to 3.35 for deliveries taking 25–29.145 days**.

The page also compares average delivery time across states with more than **300 analyzed orders**, preventing very small state samples from dominating the comparison.

The delivery-time distribution provides additional context by showing how many analyzed orders fall into each delivery-time range.

**Business use:** Operations teams can use this page to identify longer delivery segments and investigate the states or operational areas where delivery performance may require attention.

![Olist Delivery & Customer Experience](https://raw.githubusercontent.com/NikhilShah15/nikhil-portfolio/main/assets/projects/olist/Visuals/page-4.png)

**Figure 4. Olist Delivery & Customer Experience — Power BI Dashboard**

### 5.5 Payment & Revenue Analysis

The **Payment & Revenue Analysis** page provides an additional view of customer payment behavior through:

- Payment value by payment method
- Payment value by installment count
- Multiple-payment orders over time
- Total sales
- Payment revenue
- Average payment per order

This page complements the merchandise-sales analysis by showing how customer payments are distributed across payment methods and installment behavior.

The multiple-payment view also allows management to observe changes in the number of orders involving more than one payment over the available period.

**Business use:** The page can support monitoring of payment behavior and help identify payment patterns that may require further investigation.

![Olist Payment & Revenue Analysis](https://raw.githubusercontent.com/NikhilShah15/nikhil-portfolio/main/assets/projects/olist/Visuals/page-5.png)

**Figure 5. Olist Payment & Revenue Analysis — Power BI Dashboard**

### 5.6 Dashboard as a Decision-Support Tool

The dashboard is structured to move from overall business performance to specific operational areas:

**Executive Overview → Product & Sales → Customer & Orders → Delivery & Customer Experience → Payment & Revenue**

Each page supports findings established through the underlying analysis rather than introducing unsupported conclusions.

For example:

- The Executive Overview highlights the ₹13.59M overall merchandise sales and major sales contributors.
- Product analysis explains the different ways categories such as Health & Beauty, Bed Bath & Table, and Watches & Gifts generate revenue.
- Customer analysis tracks the increase in repeated orders from 36 to 277.
- Delivery analysis highlights the 4.45 to 3.35 review-score difference across delivery-time ranges.
- Payment analysis provides additional visibility into how customers complete their purchases.

The dashboard therefore allows decision-makers to move from “What is happening?” to “Where is it happening?” and then “What should we investigate or act on?”

The dashboard itself does not establish causality. Its purpose is to make the analyzed metrics interactive, comparable, and easier to monitor, while the business recommendations remain grounded in the evidence established through the analysis.

#### Decision-Support Value

The dashboard can help the business:

- Protect high-performing revenue sources by monitoring major categories and markets.
- Prioritize products and categories based on sales volume and value.
- Monitor repeat-order activity alongside new-customer orders.
- Identify longer delivery segments that warrant operational investigation.
- Monitor payment behavior and changes in multiple-payment orders.
- Investigate unusual movements in sales and order volume before deciding on inventory or promotional actions.

---

## 6. Conclusion

The analysis provides an overall view of sales performance, customer behavior, product categories, geographic markets, delivery experience, and payment activity within the Olist e-commerce business.

The business generated approximately ₹13.59M in merchandise sales, with significant contributions from Health & Beauty (₹1.26M) and São Paulo (₹5.20M). Category and state-level analysis also showed that strong performance can come from different sources, including higher sales volume and higher value per order.

Customer experience represents an important operational area. Average review scores declined from 4.45 for orders delivered within 0–5 days to 3.35 for orders taking 25–29.145 days, indicating an association between longer delivery times and lower customer ratings. This provides a basis for monitoring and investigating longer-delivery segments.

Customer behavior also showed increasing repeat-order activity, with repeated orders rising from 36 in January 2017 to 277 in February 2018, while new customers continued to represent the majority of orders. This indicates that both customer acquisition and repeat purchasing are relevant to order growth.

The analysis further shows that sales performance cannot be assessed through order volume alone. For example, between August and September 2017, orders decreased by 46 while sales increased by approximately ₹50.4K, whereas between July and August 2018, orders increased by 220 while sales decreased by approximately ₹40.8K. This highlights the importance of considering order value and category composition when evaluating changes in revenue.

Based on these findings, the key areas requiring continued business attention are maintaining availability of high-performing products and markets, managing categories according to their sales characteristics, monitoring longer delivery times, strengthening repeat purchasing, and evaluating sales through both order volume and order value.

The accompanying Power BI dashboard provides an interactive view of these measures, allowing users to monitor performance across products, states, customers, delivery periods, and payment behavior. The dashboard can therefore be used alongside this report to review current patterns, investigate areas requiring attention, and support operational decision-making based on the analyzed measures.

Overall, the findings provide a data-backed basis for maintaining strong-performing areas, identifying operational risks, and directing further investigation toward areas with measurable differences in performance.
