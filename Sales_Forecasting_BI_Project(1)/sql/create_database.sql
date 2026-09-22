CREATE DATABASE SalesDB;
GO
USE SalesDB;
GO
CREATE TABLE Sales (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE,
    Product VARCHAR(100),
    Category VARCHAR(50),
    Region VARCHAR(30),
    State VARCHAR(50),
    Customer_Segment VARCHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(12,2),
    Sales DECIMAL(14,2),
    Discount DECIMAL(5,2),
    Profit DECIMAL(14,2)
);
GO
