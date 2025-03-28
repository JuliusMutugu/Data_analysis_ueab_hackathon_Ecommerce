create database Ecommerce;

use Ecommerce;

desc sales;

set sql_safe_updates = 0;

-- change column to date type 
UPDATE sales
SET `Order Date` = CASE  
    WHEN `Order Date` LIKE '%/%' THEN date_format(str_to_date(`Order Date`, '%m/%d/%Y'), '%Y/%m/%d')
    ELSE NULL  
END;

ALTER TABLE sales 
MODIFY COLUMN `Order Date` DATE;


select * from sales;

-- best performing month
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,  
       SUM(`Total Price`) AS Total_Sales  
FROM sales
GROUP BY Month  
ORDER BY Total_Sales DESC  
LIMIT 2;



-- best days of the week
SELECT DAYNAME(`Order Date`) AS Day_of_Week,  
       SUM(`Total Price`) AS Total_Sales  
FROM sales
GROUP BY Day_of_Week  
ORDER BY FIELD(Day_of_Week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- top 5 customers 
SELECT `Customer ID`, SUM(`Total Price`) AS Total_Spent  
FROM sales
GROUP BY `Customer ID`  
ORDER BY Total_Spent DESC  
LIMIT 5;

-- regions with the most revenue 
SELECT `Region`, SUM(`Total Price`) AS Total_Sales  
FROM sales  
GROUP BY `Region`  
ORDER BY Total_Sales DESC;

-- customers with multiple purchases per month
SELECT `Customer ID`, COUNT(*) AS Order_Count,  
       DATE_FORMAT(`Order Date`, '%Y-%m') AS Order_Month  
FROM sales
GROUP BY `Customer ID`, Order_Month  
HAVING Order_Count > 1  
ORDER BY Order_Count DESC
limit 3;

-- customer spending per order 
SELECT AVG(`Shipping Fee`) AS Average_Order_Value  
FROM sales;

-- customer spending by region
SELECT `Region`,  
       SUM(`Total Price`) AS Total_Sales,  
       COUNT(DISTINCT `Customer ID`) AS Total_Customers,  
       SUM(`Total Price`) / COUNT(DISTINCT `Customer ID`) AS Avg_Spending_Per_Customer  
FROM sales 
GROUP BY `Region`  
ORDER BY Total_Sales DESC;

-- based on spending 
SELECT `Customer ID`,  
       SUM(`Total Price`) AS Total_Spent,  
       CASE  
           WHEN SUM(`Total Price`) >= 15000 THEN 'High Spender'  
           WHEN SUM(`Total Price`) BETWEEN 7000 AND 14999 THEN 'Mid Spender'  
           ELSE 'Low Spender'  
       END AS Spending_Category  
FROM sales
GROUP BY `Customer ID`  
ORDER BY Total_Spent DESC;


desc sales;

-- new versus returning customers 
SELECT 
    `customer Id`,
    COUNT(`Order Date`) AS Purchase_Count,
    CASE 
        WHEN COUNT(`Order Date`) > 1 THEN 'Returning'
        ELSE 'New'
    END AS Customer_Type
FROM sales
GROUP BY `customer id` ;


-- age group in relation to spending 
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+' 
    END AS Age_Group,
    Gender,
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN `Shipping Status` = 'Returned' THEN 1 ELSE 0 END) AS Total_Returns,
    ROUND((SUM(CASE WHEN `Shipping Status` = 'Returned' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS Return_Rate_Percentage,
    ROUND(AVG(`Total Price`), 2) AS Avg_Spending
FROM sales
GROUP BY Age_Group, Gender
ORDER BY Return_Rate_Percentage DESC;










