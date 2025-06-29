CREATE DATABASE ONE;

CREATE TABLE PRODUCTS (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Category NVARCHAR(50),
    ProductName NVARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (Category, ProductName, Price) VALUES
('Electronics', 'Smartphone', 699.99),
('Electronics', 'Laptop', 999.99),
('Electronics', 'Tablet', 499.99),
('Electronics', 'Smartwatch', 199.99),
('Electronics', 'Camera', 999.99),  -- Same price as Laptop
('Home Appliances', 'Refrigerator', 1200.00),
('Home Appliances', 'Microwave', 150.00),
('Home Appliances', 'Washing Machine', 800.00),
('Home Appliances', 'Air Conditioner', 600.00),
('Furniture', 'Sofa', 1200.00),
('Furniture', 'Dining Table', 800.00),
('Furniture', 'Chair', 150.00);

WITH RankedProducts AS (
    SELECT 
        Category,
        ProductName,
        Price,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS RowNum
    FROM 
        Products
)
SELECT 
    Category,
    ProductName,
    Price
FROM 
    RankedProducts
WHERE 
    RowNum <= 3;


WITH RankedProducts AS (
    SELECT 
        Category,
        ProductName,
        Price,
        RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS RankNum
    FROM 
        Products
)
SELECT 
    Category,
    ProductName,
    Price
FROM 
    RankedProducts
WHERE 
    RankNum <= 3;   


WITH RankedProducts AS (
    SELECT 
        Category,
        ProductName,
        Price,
        DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS DenseRankNum
    FROM 
        Products
)
SELECT 
    Category,
    ProductName,
    Price
FROM 
    RankedProducts
WHERE 
    DenseRankNum <= 3;