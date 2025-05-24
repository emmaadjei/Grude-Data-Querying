-- Creation of GRUDE Database ##
CREATE DATABASE GRUDE;
USE GRUDE;
DESCRIBE mini_store;

-- Removing "$" and ","
UPDATE mini_store
SET `Unit Price` = REPLACE(`Unit Price`,'$','');

UPDATE mini_store
SET `Unit Price` = REPLACE(`Unit Price`, ',', '');

SELECT *
FROM mini_store;

-- Changing data type of Unit Price FROM TEXT to decimal 
ALTER TABLE mini_store
MODIFY COLUMN `Unit Price` DECIMAL (10,2);

ALTER TABLE mini_store
CHANGE `Unit Price` Unit_Price DECIMAL(10, 2);


-- Changing date from text to date
UPDATE mini_store
SET Date = str_to_date(Date, '%m/%d/%Y');

-- Altering table to change data type for date from text to date 
ALTER TABLE  mini_store
MODIFY COLUMN Date Date;

DESCRIBE mini_store;

-- 1. All sales made on January 1, 2019  
SELECT *
FROM mini_store
WHERE Date = '2019-01-01';


-- 2. All transactions where the unit price exceeds 10
SELECT *
FROM mini_store
WHERE  Unit_Price > 10;

-- 3. All products that sells less than 5 units 
SELECT *
FROM mini_store
WHERE  Quantity < 5;

-- 4. All products with their category that made sales greater than 2000 dollars
SELECT Product, Category, (Unit_Price*Quantity) AS Total_Sales
FROM mini_store
WHERE (Unit_Price*Quantity) > 2000;

-- 5. All products that are less than 500 dollars but resulted in a total revenue of more than 30000 dollars.
SELECT Product, SUM(Unit_Price*Quantity) AS Total_revenue
FROM mini_store
WHERE Unit_Price < 500
GROUP BY Product
HAVING Total_revenue > 30000;

-- 6. Country with highest total revenue
SELECT Country, SUM(Quantity * Unit_Price) AS Total_revenue
FROM mini_store
GROUP BY Country
ORDER BY Total_revenue DESC
LIMIT 1;

-- 7. last five transactions made in the time period
SELECT *
FROM mini_store
ORDER BY `Date` DESC, `Order ID` DESC
LIMIT 5;

-- 8. The country with the lowest total revenue
SELECT Country, SUM(Unit_Price*Quantity) AS Total_revenue
FROM mini_store
GROUP BY Country 
ORDER BY Total_revenue ASC
LIMIT 1;

-- 9. Products that cost 15 dollars and have recorded less than 5 items
SELECT Product
FROM mini_store
WHERE Unit_Price = 15 AND Quantity < 5;

-- 10. Products sold the most
SELECT Product, SUM(Quantity) AS TotalQuantity
FROM mini_store
GROUP BY Product
ORDER BY TotalQuantity DESC
LIMIT 1;

-- 11. Products sold the most in each of the countries
SELECT Country, Product, SUM(Quantity) AS TotalQuantity
FROM mini_store
GROUP BY Country, Product
ORDER BY Country, TotalQuantity DESC;

SELECT *
FROM mini_store;

