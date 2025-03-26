# 🛒 E-Commerce Sales Analysis Hackathon


## 📌 Table of Contents  
1. [Project Overview](#-project-overview)
2. [Introduction](#-introduction).
3. [🛠️ Data Cleaning Process](#️-data-cleaning-process)  
   - [Handling Missing Values](#1️⃣-handling-missing-values)  
   - [Ensuring Data Consistency](#2️⃣-ensuring-data-consistency)  
   - [Initial Data Exploration](#3️⃣-initial-data-exploration-using-excel-pivot-tables)  
4. [📊 Data Visualization & Insights](#data-visualization--insights)  
   - [Best Performing Regions](#best-performing-regions)  
   - [Best-Selling Product](#best-selling-product)  
   - [Correlation Analysis](#correlation-analysis)  
   - [Best Month for Sales](#best-month-for-sales)  
5. [🛢️ SQL Analysis](#sql-analysis)  
   - [Database Setup](#database-setup)  
   - [Data Preprocessing](#data-preprocessing)  
   - [Important Queries](#important-queries)  
6. [📊 Power BI Visuals](#power-bi-visuals)  
   - [Major Questions Considered](#major-questions-considered)  
7. [📈 Sales & Customer Insights](#-e-commerce-sales--customer-insights-report)  
   - [Sales Analysis](#1-sales-analysis)  
   - [Customer Behavior](#2-customer-behavior)  
8. [🚀 Recommendations](#Recommendations)  

---

## 📌 Project Overview 
This project focuses on analyzing **Ecommerce sales and customer insights** using **Excel, Python (EDA), and Power BI** to uncover hidden patterns in the data.  
The goal is to win the **Data Analytics Hackathon at the University of Eastern Africa, Baraton** by deriving actionable insights.

---
## Introduction
This dataset contains **E-commerce sales transaction data**, including **customer demographics (age, gender, region), product categories, order details, total sales value, shipping status, and return rates**. The data provides insights into **sales trends, customer purchasing behavior, and operational efficiency**.  

### **Purpose of the Analysis**  
The goal of this analysis is to **uncover patterns and trends** that can help businesses:  
✅ Identify **top-performing products and regions**  
✅ Understand **customer spending behavior and segmentation**  
✅ Improve **order fulfillment efficiency and reduce return rates**  
✅ Optimize **marketing and inventory management strategies**  

Using **Excel (data cleaning), Python (EDA), SQL (data querying), and Power BI (visualization)**, this analysis delivers **data-driven insights and actionable recommendations** to enhance **sales performance, customer retention, and business decision-making**. 
---


## 🛠️ Data Cleaning Process
**Tool Used:** [Excel 2019](www.microsoft.com/office/2019)

### 1️⃣ Handling Missing Values
- **Age Column**: Filled missing values using the **median** to avoid decimal inconsistencies.  
- **Region Column**: Replaced missing values with the most frequent region (**West**), identified using a count function.  
- **Shipping Status Column**: Assigned missing values as **"unknown"**, since they accounted for more than **10%** of the dataset, ensuring effective visualization.

### 2️⃣ Ensuring Data Consistency
- **Unit Price**: Rounded to **two decimal places** for uniformity.  
- **Shipping Status**: Standardized text formatting and removed extra spaces.  

### 3️⃣ Initial Data Exploration using Excel Pivot Tables
To gain preliminary insights, a **Pivot Table** was used before proceeding with in-depth analysis.  
![sales_pivot_table](https://github.com/user-attachments/assets/33e80657-910d-487e-a740-18276830625d)

---

## Data Visualization & Insights  
Key business-related questions were explored to gain deeper insights into sales performance.  

### Best Performing Regions  
![best_performing_region](https://github.com/user-attachments/assets/f377874f-ee9f-4275-9636-b9687f271369)

### Best-Selling Product  
![best_selling_product](https://github.com/user-attachments/assets/c587c895-051b-4deb-a93c-fc796689c783)

### Correlation Analysis  

![correlation_heat_matp](https://github.com/user-attachments/assets/b5776b69-d762-4da0-9217-68934dea1ad2)

### Best Month for Sales  
![best_month sales](https://github.com/user-attachments/assets/234207aa-053d-458f-bc1c-b917503d8c3c)


### Findings  
- The **West** region had the highest sales, indicating a strong market presence.  
- **Product X** was the best-selling item, suggesting potential for stock expansion.  
- The **correlation heatmap** provided insights into sales-driving factors.  
- **Returned products analysis** helped identify refund trends and potential improvement areas.  
---
## Sql Analysis

### Database Setup  
The dataset was imported into MySQL, and the necessary transformations were performed.  
```sql
CREATE DATABASE Ecommerce;
USE Ecommerce;
```
### Data Preprocessing 
```sql
  UPDATE sales
  SET `Order Date` = CASE  
      WHEN `Order Date` LIKE '%/%' THEN date_format(str_to_date(`Order Date`, '%m/%d/%Y'), '%Y/%m/%d')  
      ELSE NULL  
  END;
  
  ALTER TABLE sales MODIFY COLUMN `Order Date` DATE;
```
### Important Queries 
#### best sales date of the week
```sql
  SELECT DAYNAME(`Order Date`) AS Day_of_Week,  
         SUM(`Total Price`) AS Total_Sales  
  FROM sales  
  GROUP BY Day_of_Week  
  ORDER BY FIELD(Day_of_Week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
```
#### top 5 customers
```sql
  SELECT `Customer ID`, SUM(`Total Price`) AS Total_Spent  
FROM sales  
GROUP BY `Customer ID`  
ORDER BY Total_Spent DESC  
LIMIT 5;
```
#### highest revenue regions
```sql
SELECT `Region`, SUM(`Total Price`) AS Revenue  
FROM sales  
GROUP BY `Region`  
ORDER BY Revenue DESC  
LIMIT 3;
```

## Power Bi Visuals. 
![sales_dashboard](https://github.com/user-attachments/assets/bcfb37ed-9fa4-4edb-b00d-01a4b5479998)

### Major Questions considered. 
**Sales Analysis**
1. What are the total sales by region?
2. Which product category generates the highest revenue?
3. What is the average shipping fee by region?
**Customer Behaviour**
4. How does customer age impact purchasing behavior?
5. What is the most popular product by gender?
Order Fulfillment
6. What is the order fulfillment rate (delivered vs. returned)?
7. Are there any trends in shipping status over time?

### other questions? 
Best age group contribution to the market? 
Best Customers? 
New versus Old Customers? 
## 📊 E-Commerce Sales & Customer Insights Report

### 1. Sales Analysis
#### 🔹 What are the total sales by region?
- **West:** $391K (29.01%) 🏆
- **East:** $330K (24.5%)
- **North:** $325K (24.13%)
- **South:** $301K (22.36%)
📌 **Insight:** The **West region leads in total sales**, but differences between regions are small.

#### 🔹 Which product category generates the highest revenue?
- **Laptops:** $0.70M 🏆
- **Smartphones:** $0.35M
- **Monitors:** $0.15M
📌 **Insight:** **Laptops dominate** in revenue generation.

#### 🔹 What is the average shipping fee by region?
- Data on shipping fees is not available, but shipping **status by region** is:
  - **West has the highest delivery count**, while **North has more returned items**.

---

###  2. Customer Behavior
#### 🔹 How does customer age impact purchasing behavior?
- **Most spending:** **36-45 & 46-55 age groups**.
- **Least spending:** **18-25 age group.**
📌 **Insight:** Older customers **spend more per order**, making them a priority for high-ticket items.

#### 🔹 What is the most popular product by gender?
- **Men prefer Monitors & Laptops.**
- **Women prefer Laptops & Monitors (decision split).**
📌 **Insight:** Target **men with high-performance products**, while women may prefer **versatile devices**.

---

### 📌 3. Order Fulfillment & Logistics
#### 🔹 What is the order fulfillment rate (delivered vs. returned)?
- **Delivered:** Majority of products.
- **Returned:** Higher in **North region**.
📌 **Insight:** **North has a fulfillment issue**—possibly due to **logistics or product expectations**.

### 🔹 Are there trends in shipping status over time?
- **No clear pattern, but returns remain consistent.**
📌 **Insight:** Need to **investigate reasons for returns** (product issues, miscommunication, or logistics).

### **other Power BI Insights & Key Findings**
- 📊 **Sales Dashboard:** West region dominates sales; low performance in South.  
- 📈 **Customer Segmentation:** 36-45 age group spends the most.  
- 🔄 **Return Trends:** North region has the most returns.  


---

## Recommendations
1️⃣ **Boost customer retention** with loyalty programs & personalized offers.  
2️⃣ **Target high-value customer segments** (36-55 age group) with premium deals.  
3️⃣ **Reduce product returns** by improving product descriptions and logistics in **North region**.  
4️⃣ **Create gender-focused marketing**—highlight performance for men & versatility for women.  
5️⃣ **Optimize sales in underperforming regions** with location-specific promotions.  

📌 **Final Thought:**  
By leveraging these insights, the company can **increase revenue, improve retention, and optimize logistics.** and also do invest in ensuring most return rate is reduced.  




  

