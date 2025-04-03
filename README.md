# E-Commerce Sales Analysis Hackathon

## Table of Contents  
1. Project Overview  
2. Introduction  
3. Data Cleaning Process  
   - Handling Missing Values  
   - Ensuring Data Consistency  
   - Initial Data Exploration  
4. Data Visualization & Insights  
   - Best Performing Regions  
   - Best-Selling Product  
   - Correlation Analysis  
   - Best Month for Sales  
5. SQL Analysis  
   - Database Setup  
   - Data Preprocessing  
   - Important Queries  
6. Power BI Visuals  
   - Sales Analysis  
   - Customer Insight  
7. Recommendations  

---

## Project Overview  
This project focuses on analyzing **E-commerce sales and customer insights** using **Excel, Python (EDA), and Power BI** to uncover hidden patterns in the data. The goal is to win the **Data Analytics Hackathon at the University of Eastern Africa, Baraton** by deriving actionable insights.

---

## Introduction  
This dataset contains **E-commerce sales transaction data**, including **customer demographics (age, gender, region), product categories, order details, total sales value, shipping status, and return rates**. The data provides insights into **sales trends, customer purchasing behavior, and operational efficiency**. 

The purpose of this analysis is to **uncover patterns and trends** that can help businesses identify **top-performing products and regions**, understand **customer spending behavior and segmentation**, improve **order fulfillment efficiency and reduce return rates**, and optimize **marketing and inventory management strategies**. Using **Excel (data cleaning), Python (EDA), SQL (data querying), and Power BI (visualization)**, this analysis delivers **data-driven insights and actionable recommendations** to enhance **sales performance, customer retention, and business decision-making**.  

---

## Data Cleaning Process  
**Tool Used:** [Excel 2019](www.microsoft.com/office/2019)  

Handling missing values was a key step in ensuring data integrity. The **Age Column** had missing values that were filled using the **median** to avoid decimal inconsistencies. The **Region Column** had missing entries that were replaced with the most frequent region (**West**) as identified using a count function. The **Shipping Status Column** had over **10%** missing values, which were assigned as **"unknown"** to ensure effective visualization. 

To ensure data consistency, **Unit Price** values were rounded to **two decimal places** for uniformity, and the **Shipping Status** text formatting was standardized by removing extra spaces. Initial data exploration was conducted using **Excel Pivot Tables** to extract preliminary insights.  

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

### Number of Returns per Product  
![number_of_returned_products_](https://github.com/user-attachments/assets/f17eb7ea-9381-4013-a559-7834950c012e)  

From these analyses, we found that the **West** region had the highest sales, indicating a strong market presence. **Product X** emerged as the best-selling item, highlighting a potential opportunity for stock expansion. The **correlation heatmap** revealed key sales-driving factors, indicating variance based on age. Additionally, returned product analysis showed that monitors had the highest return rate, while smartwatches had the lowest.  

---

## SQL Analysis  

### Database Setup  
The dataset was imported into MySQL, and necessary transformations were performed.  
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
#### Best Sales Date of the Week  
```sql
  SELECT DAYNAME(`Order Date`) AS Day_of_Week,  
         SUM(`Total Price`) AS Total_Sales  
  FROM sales  
  GROUP BY Day_of_Week  
  ORDER BY FIELD(Day_of_Week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
```
![best_day_of_the_week](https://github.com/user-attachments/assets/7cef02e1-1b5d-4477-bc99-c2e23223fa13)  

---

## Recommendations  
To improve sales performance and customer satisfaction, businesses should implement **loyalty programs** and **personalized marketing campaigns** based on past purchase behavior to enhance customer retention. Strategies should be designed to **maximize revenue** from the **36-55 age group**, which contributes the highest revenue, through targeted advertising and tailored promotions. To reduce product returns, businesses should enhance product descriptions, improve quality control processes, and optimize logistics, particularly in the **North region**, where return rates are highest. **Gender-specific marketing strategies** should be employed, with men targeted for performance-based products like monitors and laptops, while women should be engaged with versatile product features. Lastly, sales performance in underperforming regions such as **South and East** should be improved through **region-specific promotions, local influencer partnerships, and location-based discounts**. By implementing these strategies, businesses can drive higher revenue, improve operational efficiency, and strengthen customer engagement for long-term profitability.

