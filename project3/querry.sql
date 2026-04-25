DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name         VARCHAR(100) NOT NULL,
    category     VARCHAR(50) NOT NULL,          -- e.g., 'Laptop', 'Phone', 'Accessories'
    brand        VARCHAR(50) NOT NULL,          -- e.g., 'Apple', 'Dell'
    price        DECIMAL(10,2) NOT NULL,        -- selling price
    cost_price   DECIMAL(10,2) NOT NULL,        -- what store pays
    stock_quantity INT NOT NULL                 -- current stock
);

DROP TABLE IF EXISTS  customers; 

CREATE TABLE customers (
    customer_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    email         VARCHAR(100) UNIQUE NOT NULL,
    city          VARCHAR(50),
    signup_date   DATE NOT NULL
);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id   INT NOT NULL,
    order_date    DATE NOT NULL,
    total_amount  DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (
    order_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id      INT NOT NULL,
    product_id    INT NOT NULL,
    quantity      INT NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


select * from products;
select * from customers;
select * from orders;
select * from order_items;

-- Below are 10 queries, each with:
-- The business question
-- The SQL
-- A short explanation

-- “Show all orders with customer name, email, and total amount.”
SELECT 
    o.order_id,
    c.first_name,
    c.last_name,
    c.email,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC;

-- “What is the total revenue (sum of unit_price * quantity) for each product category?”
SELECT p.category , SUM(p.price * p.stock_quantity) AS total_revenue
FROM order_items o
JOIN products p  ON o.product_id = p.product_id
GROUP BY 1
ORDER BY 2 DESC;

 -- “Find customers who have spent more than the average order total.”
 SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_amount) > (SELECT AVG(total_amount) FROM orders);

-- “List the top‑5 products by total quantity sold.”
SELECT 
    p.product_id,
    p.name,
    p.category,
    p.brand,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- “Show products where stock is below 15 and they had at least one sale in the last 30 days.”
SELECT DISTINCT
    p.product_id,
    p.name,
    p.category,
    p.brand,
    p.stock_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE p.stock_quantity < 15
  AND o.order_date >= DATE('2026-03-25'); 


-- “Show total revenue for each month in 2026.”
SELECT 
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(o.total_amount) AS monthly_revenue
FROM orders o
WHERE o.order_date >= '2026-01-01'
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY year, month;


-- “Show (customer name, product name, quantity, order date) for all orders of Apple‑branded products.”
SELECT 
    c.first_name,
    c.last_name,
    p.name AS product_name,
    oi.quantity,
    o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.brand = 'Apple';

 -- “Count how many orders were small (< 800), medium (800–2000), and large (> 2000).”
 SELECT
    SUM(CASE WHEN total_amount < 800 THEN 1 ELSE 0 END) AS small_orders,
    SUM(CASE WHEN total_amount BETWEEN 800 AND 2000 THEN 1 ELSE 0 END) AS medium_orders,
    SUM(CASE WHEN total_amount > 2000 THEN 1 ELSE 0 END) AS large_orders
FROM orders;

-- “Find customers who have placed more than 1 order.”
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1;
