-- Top 10 sales 
SELECT *
FROM superstore_sales
LIMIT 10;

-- Total sales and profits

SELECT 
ROUND(SUM(sales), 2) AS Total_Sales,
ROUND(SUM(profit), 2) AS Total_Profit
FROM superstore_sales;

-- Sales by category

SELECT 
category,
ROUND(SUM(sales), 2) AS Total_Sales
FROM superstore_sales
GROUP BY category
ORDER BY Total_Sales DESC;

-- Profit by Region

SELECT 
Region,
ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_sales
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Top 10 products by sales

SELECT 
`Product Name`,
ROUND(SUM(sales), 2) AS Total_Sales
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY Total_sales DESC
LIMIT 10;

-- Monthly Sales Trends

SELECT 
YEAR(`Order Date`) AS Order_Year,
MONTH(`Order Date`) AS Order_Month,
ROUND(SUM(sales), 2) AS Monthly_Sales
FROM superstore_sales
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;

-- Top 10 Product by Profit

SELECT
`Product Name`,
ROUND(SUM(Profit)) AS Total_Profit
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- Average Discount By Category

SELECT
Category,
ROUND(AVG(Discount) * 100, 2) AS AVG_Discount_Percentage
FROM superstore_sales
GROUP BY Category
ORDER BY Avg_Discount_Percentage DESC;

-- Customer Count By Segment

SELECT 
segment,
COUNT(DISTINCT `Customer ID`) AS Total_Customers,
ROUND(SUM(sales), 2) AS Total_Sales
FROM superstore_sales
GROUP BY segment
ORDER BY Total_Sales DESC;

-- Window Function
-- RANK PRODUCTS BY SALES

SELECT 
`Product Name`,
ROUND(SUM(sales), 2) AS Total_Sales,

RANK() Over(
ORDER BY SUM(sales) DESC
) AS Sales_Rank

FROM superstore_sales
GROUP BY `Product Name`;

-- CTE
-- Top Region by Profit Using CTE

WITH Region_Profit AS(
SELECT 
Region,
ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_sales
GROUP BY Region
)

SELECT *
FROM Region_Profit
ORDER BY Total_Profit DESC