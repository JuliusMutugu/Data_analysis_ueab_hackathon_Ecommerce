# 🛒 E-Commerce Sales Analysis Hackathon
## 📌 Project Overview 
This project focuses on analyzing **e-commerce sales and customer insights** using **Excel, Python (EDA), and Power BI** to uncover hidden patterns in the data.  
The goal is to win the **Data Analytics Hackathon at the University of Eastern Africa, Baraton** by deriving actionable insights.

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
Sales Analysis
1. What are the total sales by region?
2. Which product category generates the highest revenue?
3. What is the average shipping fee by region?
Customer Behaviour
4. How does customer age impact purchasing behavior?
5. What is the most popular product by gender?
Order Fulfillment
6. What is the order fulfillment rate (delivered vs. returned)?
7. Are there any trends in shipping status over time?

### other questions? 
Best age group contribution to the market? 
Best Customers? 
New versus Old Customers? 

  

