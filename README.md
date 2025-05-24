# Grude Data Querying

## Table of Contents
- [Overview](#overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Data Preparation](#data-preparation)
- [Data Querying](#data-querying)

### Overview
This project centers on leveraging data-driven insights to evaluate the sales performance of a multinational fruit and vegetable distribution company. As the data consultant, my approach is rooted in querying the dataset to equip the company with actionable intelligence to optimize sales strategies, enhance distribution effectiveness, and drive profitability across international markets.

### Data Sources
Blossom Academy Dataset: "Mini_Store.xlsx" file.

### Tools
-  MySQL Workbench
    -   [Download MySQL Workbench here](https//microsoft.com)

### Data Preparation
-  Loaded data into MySQL Workbench 
-  Cleaned and formatted the data
    -   Altered tables, updated tables, replaced characters, modified column, set date

### Data Querying
This involves querying the data to address key questions, including:

- /**All products that are less than 500 dollars but resulted in a total revenue of more than 30000 dollars.**/

```SELECT``` Product, SUM(Unit_Price*Quantity) AS Total_revenue

```FROM``` mini_store

```WHERE``` Unit_Price < 500

```GROUP BY``` Product

```HAVING``` Total_revenue > 30000;


- /**Country with highest total revenue**/

```SELECT``` Country, SUM(Quantity * Unit_Price) AS Total_revenue

```FROM``` mini_store

```GROUP BY``` Country

```ORDER BY``` Total_revenue DESC

```LIMIT``` 1;


- /**Last five transactions made in the time period**/

```SELECT``` *

```FROM``` mini_store

```ORDER BY``` `Date` DESC, `Order ID` DESC

```LIMIT``` 5;


- /**The country with the lowest total revenue**/

```SELECT``` Country, SUM(Unit_Price*Quantity) AS Total_revenue

```FROM``` mini_store

```GROUP BY``` Country 

```ORDER BY``` Total_revenue ASC

```LIMIT``` 1;


- /**Products that cost 15 dollars and have recorded less than 5 items**/

```SELECT``` Product

```FROM``` mini_store

```WHERE``` Unit_Price = 15 AND Quantity < 5;


- /**Products sold the most**/

```SELECT``` Product, SUM(Quantity) AS TotalQuantity

```FROM``` mini_store

```GROUP BY``` Product

```ORDER BY``` TotalQuantity DESC

```LIMIT``` 1;


- /**Products sold the most in each of the countries**/

```SELECT``` Country, Product, SUM(Quantity) AS TotalQuantity

```FROM``` mini_store

```GROUP BY``` Country, Product

```ORDER BY``` Country, TotalQuantity DESC;





