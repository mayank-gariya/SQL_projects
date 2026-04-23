# 📊 SQL Project: Zepto Data Analysis

## 🚀 Overview
This project is a hands-on SQL practice project built around a dataset (zepto_sales.csv ).  
The goal of this project is to strengthen SQL fundamentals by working with real-world-like data, writing queries, and extracting meaningful insights.

Instead of just learning syntax, this project focuses on **thinking in SQL** — how to ask the right questions from data.

---

## 🗂️ What's Inside?
- Database schema creation
- Tables with structured data
- Relationships between entities
- Practice queries for analysis

---

## 🧠 Key Learning Goals
- Writing efficient SQL queries
- Understanding joins (INNER, LEFT, etc.)
- Aggregations using COUNT, SUM, AVG
- Filtering data using WHERE and HAVING
- Grouping and sorting data
- Real-world data analysis thinking

---

## 🏗️ Database Setup

1. Clone this repository
2. Open your SQL environment (MySQL / PostgreSQL / SQLite)
3. Run the SQL file:

```sql
SOURCE zepto_v2.csv;
```

---

## 📌 Example Use Cases
- Analyze customer behavior
- Track order trends
- Find top-performing products
- Identify patterns in sales

---

## 💡 Why This Project?
Most beginners just write basic queries.  
This project pushes you to:
- Think like a data analyst
- Solve real problems using SQL
- Build confidence for interviews & projects

---

## 📄 SQL File (Reference)
Below is the full SQL file used in this project:

```sql
drop table if exists zepto;

-- creating the zepto table with their proper data type
create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);

-- checking the data is loaded or not 
select * from zepto;

--data exploration
-- count of rows 
select count(*) from zepto;

-- sample data
select * from zepto 
limit 10 ;

-- null values
select * from zepto 
where name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--different product categories

select category
from zepto 
group by category
order by category;

--products in stock vs out of stock
select outOfStock ,count(sku_id)
from zepto 
group by outOfStock;

--product names present multiple times

select name , count(sku_id)
from zepto
group by name 
having count(sku_id)>1
order by count(sku_id) desc;

--data cleaning

--products with price = 0
select * from zepto 
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto
where mrp = 0;

-- conversion of paisa to rupee
update zepto 
set mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto;

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

--Q2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT name,mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

--Q3.Calculate Estimated Revenue for each category
select distinct category , sum(discountedSellingPrice * availableQuantity) as revenue 
from zepto 
group by category
order by revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name ,mrp ,discountPercent
from zepto 
where mrp > 500 and discountPercent < 10
order by mrp desc , discountPercent desc ;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select distinct category , round(avg(discountPercent),2) as avgdiscountPercent
from zepto 
group by category
order by avgdiscountPercent;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select mrp ,weightInGms , discountedSellingPrice , round(discountedSellingPrice/weightInGms,2) as pricepergram
from zepto 
where weightInGms >= 100.0
order by pricepergram;

--Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name , weightInGms ,
case when weightInGms < 1000 then  'low'
     when weightInGms < 5000 then 'medium'
	 else 'bulk'
	 end as weight_category
from zepto;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;

-- Q9 Which products should be restocked first?
select distinct name ,outOfStock ,availableQuantity
from zepto 
where outOfStock = True or availableQuantity < 5 
limit 10 ;

-- Q10 Detect pricing anomalies
select mrp , discountPercent 
from zepto 
where mrp < discountPercent;

-- yes their are 15 rows with discountPercent is more than mrp 

-- Q11 Products with maximum price drop
select distinct name , (mrp - discountedSellingPrice) as priceDrop
from zepto 
order by priceDrop
limit 5;

-- Q12 Top 5 most expensive products (MRP) in each categroy
select distinct name ,mrp 
from zepto 
order by mrp desc
limit 5;


```

---

## 🛠️ Tools You Can Use
- MySQL Workbench
- PostgreSQL (pgAdmin)
- SQLite
- VS Code + SQL extensions

---

## 📈 Future Improvements
- Add advanced queries (window functions)
- Build dashboard using Power BI / Tableau
- Convert into a full data analytics project

---

## 🤝 Contribution
Feel free to fork this project and improve it.  
Add more queries, optimize existing ones, or build visualizations on top of it.

---

## ⭐ Final Note
This isn't just a project — it's a **practice playground**.  
The more you experiment, the better you'll get at SQL.

Happy querying! 🚀
