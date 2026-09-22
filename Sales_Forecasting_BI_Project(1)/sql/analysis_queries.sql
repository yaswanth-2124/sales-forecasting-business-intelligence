USE SalesDB;
GO
-- Monthly sales and profit
SELECT YEAR(Order_Date) AS Sales_Year, MONTH(Order_Date) AS Sales_Month,
       SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit,
       SUM(Quantity) AS Total_Quantity
FROM Sales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Sales_Year, Sales_Month;

-- Category performance
SELECT Category, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM Sales GROUP BY Category ORDER BY Total_Sales DESC;

-- Regional performance
SELECT Region, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM Sales GROUP BY Region ORDER BY Total_Sales DESC;

-- Top products
SELECT TOP 10 Product, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM Sales GROUP BY Product ORDER BY Total_Sales DESC;
