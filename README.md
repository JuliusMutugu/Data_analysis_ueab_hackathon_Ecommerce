#  E-Commerce Sales Analysis Hackathon
## Project Overview 
This project focuses on analyzing e-commerce sales and customer insights using **Excel, Python (EDA), and Power BI** to uncover hidden pattern in the data. This is with a goal to win a data analytics hackathon at the university of Eastern Africa, Baraton. 

---

## 🛠️ Data Cleaning Process using 
Here i used **excel** to ensure the data is ready for Exploratory Data Analysis by following the outlined guide:
Tool used [Excel 2019](www.microsoft.com/office/2019)

### 1.  Handling Missing Values
- **Age Column**: Filled missing values using the **median** to avoid decimal issues.
- **Region Column**: Filled missing values with the most frequent region (**West**) used a count function to determine the common value.
- **Shipping Status Column**: Replaced missing values with **"unknown"** since the missing values are more than 10% for much effective visualization.

### 2️. Ensuring Data Consistency
- **Unit Price**: Rounded to **2 decimal places** for uniformity.
- **Shipping Status**: Standardized text formatting and removed extra spaces

### 3. Excel pivot table for more insights about the data 
Here i used **pivot table** to better understand the data before progressing any further 
![sales_pivot_table](https://github.com/user-attachments/assets/c362c2e0-2d3f-4edb-b068-3dc6fc733815)

---
## Data Visualization & Insights

### Best-Selling Product Analysis

Bar chart for most frequently purchased products.

```python
import matplotlib.pyplot as plt

# Group sales by product and get top 10
top_products = sales_dataframe.groupby("Product Name")["Total Price"].sum().nlargest(10)

# Plot bar chart
plt.figure(figsize=(12,6))
top_products.plot(kind="bar", color="royalblue", edgecolor="black")

# Customize labels and title
plt.xlabel("Product Name")
plt.ylabel("Total Sales")
plt.title("Top 10 Best-Selling Products")
plt.xticks(rotation=45)  
plt.grid(axis="y", linestyle="--", alpha=0.7)

# Show the plot
plt.show()
```

### Sales Trends Over Time

Line chart for monthly sales trends.

Observed seasonal spikes.

### Correlation Analysis

Heatmap for correlation between numerical variables.

### Regional Segmentation

Pie chart for total sales per region.

Highlighted top-performing region.

### Product Returns Analysis

Bar chart for returned products by region.




