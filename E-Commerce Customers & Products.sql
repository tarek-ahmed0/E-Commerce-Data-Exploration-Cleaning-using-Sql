-- Data Ingestion
-- Create New DB E-Commerce To Import CSV File (Dataset).
CREATE DATABASE `E-Commerce Customers & Products`;

-- Data Cleaning
-- When I took a quick look at the Data, I noticed an outlier in Meat Products Column, So we will remove it and put the average
SELECT MIN(Meat), AVG(Meat), MAX(Meat)
FROM `e-commerce customers & products`.dataset;

SELECT Meat
FROM `e-commerce customers & products`.dataset
ORDER BY Meat DESC
LIMIT 10;

-- After Checking & Testing I confirmed theat the Outlier is 400000
-- The Average of Meat Amount Spend is 345.5196

SELECT *
FROM `e-commerce customers & products`.dataset
WHERE Meat = (
	SELECT MAX(Meat)
    FROM `e-commerce customers & products`.dataset
);

-- Update Outlier. 
UPDATE `e-commerce customers & products`.dataset
SET Meat = 345.5196
WHERE Meat = 400000;

-- Data Exploration
-- Calculate Total Income
SELECT SUM(Income) 
FROM `e-commerce customers & products`.dataset;

-- Calculate Total Customers
SELECT COUNT(`Customer ID`)
FROM `e-commerce customers & products`.dataset; 

-- Calculate AVG Customer Income
SELECT SUM(Income) / COUNT(`Customer ID`)
FROM `e-commerce customers & products`.dataset; 

-- Recency Details
-- Recency Days (Last Purchase) 
SELECT MAX(`Recency - Days`), MIN(`Recency - Days`)
FROM `e-commerce customers & products`.dataset;

-- Total Customer In Previous 14 Days  
SELECT COUNT(`Recency - Days`)
FROM `e-commerce customers & products`.dataset
WHERE `Recency - Days` BETWEEN 0 AND 14; 

-- Total Customer In 15 To 30 Previous Days  
SELECT COUNT(`Recency - Days`)
FROM `e-commerce customers & products`.dataset
WHERE `Recency - Days` BETWEEN 15 AND 30; 

-- Total Customer In 31 To 60 Previous Days  
SELECT COUNT(`Recency - Days`)
FROM `e-commerce customers & products`.dataset
WHERE `Recency - Days` BETWEEN 31 AND 60; 

-- Total Customer In 61 To 99 Previous Days  
SELECT COUNT(`Recency - Days`)
FROM `e-commerce customers & products`.dataset
WHERE `Recency - Days` BETWEEN 61 AND 99;

-- Products Details
-- Total Amout Spend On Fruits Products
SELECT SUM(Fruits)
FROM `e-commerce customers & products`.dataset;

-- Total Amout Spend On Meat Products
SELECT SUM(Meat)
FROM `e-commerce customers & products`.dataset; 

-- Total Amout Spend On Sweets Products
SELECT SUM(Sweets)
FROM `e-commerce customers & products`.dataset;

-- Total Amout Spend On Gold Products
SELECT SUM(`Gold Products`)
FROM `e-commerce customers & products`.dataset;

-- Purchases Details
-- Total Puchases
SELECT SUM(`Deal Purchases`) + SUM(`Store Purchases`) + SUM(`Web Purchases`) + SUM(`Catalog Purchases`) AS TotalPurchaese
FROM `e-commerce customers & products`.dataset;

-- Number Of Deal Purchases  
SELECT SUM(`Deal Purchases`)
FROM `e-commerce customers & products`.dataset;

-- Number Of Web Purchases  
SELECT SUM(`Web Purchases`)
FROM `e-commerce customers & products`.dataset;

-- Number Of Catalog Purchases  
SELECT SUM(`Catalog Purchases`)
FROM `e-commerce customers & products`.dataset;

-- Number Of Store Purchases  
SELECT SUM(`Store Purchases`)
FROM `e-commerce customers & products`.dataset;

-- Purchases Variable
SET @TotalPurchases = 33291;
SET @DealPurchases = 5208;
SET @WebPurchases = 9150;
SET @StorePurchases = 12970;
SET @CatalogPurchases = 5963;

-- Deal Purcahes Per of Total Purchaes
SELECT @DealPurchases / @TotalPurchases;

-- Web Purcahes Per of Total Purchaes
SELECT @WebPurchases / @TotalPurchases;

-- Store Purcahes Per of Total Purchaes
SELECT @StorePurchases / @TotalPurchases;

-- Catalog Purcahes Per of Total Purchaes
SELECT @CatalogPurchases / @TotalPurchases;

-- Calculate Total Website Visits
SELECT SUM(`Total Website Visits`)
FROM `e-commerce customers & products`.dataset;

-- Calculate Total Customers Complains 
SELECT SUM(Complains) 
FROM `e-commerce customers & products`.dataset;
   
-- Calculate Customers Complains Percentage
SELECT SUM(Complains) / COUNT(`Customer ID`)
FROM `e-commerce customers & products`.dataset;

-- Accepted Campaigns
-- Campaign 1
SELECT COUNT(`Accepted Campaign1`)
FROM `e-commerce customers & products`.dataset
WHERE `Accepted Campaign1` = 1;

-- Campaign 2
SELECT COUNT(`Accepted Campaign2`)
FROM `e-commerce customers & products`.dataset
WHERE `Accepted Campaign2` = 1;

-- Campaign 3
SELECT COUNT(`Accepted Campaign3`)
FROM `e-commerce customers & products`.dataset
WHERE `Accepted Campaign3` = 1; 

-- Campaign 4
SELECT COUNT(`Accepted Campaign4`)
FROM `e-commerce customers & products`.dataset
WHERE `Accepted Campaign4` = 1; 

-- Last Campaign - Response
SELECT COUNT(`Response - Last Campaign`)
FROM `e-commerce customers & products`.dataset
WHERE `Response - Last Campaign` = 1; 

-- Top 5 Customers - Income 
SELECT `Customer ID`, Income
FROM `e-commerce customers & products`.dataset
ORDER BY Income DESC
LIMIT 5;
