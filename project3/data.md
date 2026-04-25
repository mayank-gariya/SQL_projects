data you need 

Insert products (laptops + phones + accessories)
sql
-- Products
INSERT INTO products (name, category, brand, price, cost_price, stock_quantity) VALUES
('MacBook Pro 14"', 'Laptop', 'Apple', 1999.99, 1600.00, 15),
('Dell XPS 13', 'Laptop', 'Dell', 1299.99, 1000.00, 20),
('Lenovo ThinkPad T14', 'Laptop', 'Lenovo', 1499.99, 1150.00, 12),
('HP Spectre x360', 'Laptop', 'HP', 1599.99, 1250.00, 10),
('Asus ZenBook 13', 'Laptop', 'Asus', 999.99, 750.00, 18),

('iPhone 15 Pro', 'Phone', 'Apple', 1199.99, 900.00, 25),
('Samsung Galaxy S24', 'Phone', 'Samsung', 999.99, 750.00, 30),
('Google Pixel 8', 'Phone', 'Google', 799.99, 600.00, 20),
('OnePlus 12', 'Phone', 'OnePlus', 699.99, 520.00, 28),
('Xiaomi 14', 'Phone', 'Xiaomi', 599.99, 450.00, 35),

('Noise Wireless Earbuds', 'Accessories', 'Noise', 79.99, 40.00, 50),
('Logitech Wireless Mouse', 'Accessories', 'Logitech', 49.99, 25.00, 40),
('Apple 20W USB‑C Charger', 'Accessories', 'Apple', 39.99, 18.00, 60);

Insert customers
sql
-- Customers
INSERT INTO customers (first_name, last_name, email, city, signup_date) VALUES
('Aarav', 'Sharma', 'aarav.sharma@email.com', 'Delhi', '2025-01-10'),
('Ananya', 'Singh', 'ananya.singh@email.com', 'Ghaziabad', '2025-02-05'),
('Rohan', 'Patel', 'rohan.patel@email.com', 'Noida', '2025-03-12'),
('Priya', 'Verma', 'priya.verma@email.com', 'Lucknow', '2025-04-01'),
('Vikas', 'Reddy', 'vikas.reddy@email.com', 'Hyderabad', '2025-05-08'),
('Isha', 'Khan', 'isha.khan@email.com', 'Mumbai', '2025-06-15'),
('Aditya', ' Joshi', 'aditya.joshi@email.com', 'Pune', '2025-07-20'),
('Neha', 'Malik', 'neha.malik@email.com', 'Indore', '2025-08-03');

Insert orders
sql
-- Orders (use current or older dates; adjust as needed)
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2026-01-15 10:30:00', 1999.99),
(2, '2026-01-16 14:20:00', 999.99),
(3, '2026-01-17 09:10:00', 1199.99),
(4, '2026-01-18 16:45:00', 1499.99),
(5, '2026-01-19 11:00:00', 79.99),
(1, '2026-02-01 13:15:00', 1599.99),
(3, '2026-02-02 17:00:00', 699.99),
(6, '2026-02-03 10:40:00', 1299.99),
(7, '2026-02-04 15:30:00', 1039.98), -- 2 items
(8, '2026-02-05 12:25:00', 1179.97);  -- 3 items

Insert order_items (tie products to orders)
sql
-- Order_items

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
-- Order 1: MacBook Pro 14"
(1, 1, 1, 1999.99),
-- Order 2: Samsung Galaxy S24
(2, 7, 1, 999.99),
-- Order 3: iPhone 15 Pro
(3, 6, 1, 1199.99),
-- Order 4: Lenovo ThinkPad T14
(4, 3, 1, 1499.99),
-- Order 5: Noise Wireless Earbuds
(5, 11, 1, 79.99),
-- Order 6: HP Spectre x360
(6, 4, 1, 1599.99),
-- Order 7: OnePlus 12
(7, 9, 1, 699.99),
-- Order 8: Dell XPS 13
(8, 2, 1, 1299.99),
-- Order 9: 2 accessories (mouse + charger)
(9, 12, 1, 49.99),
(9, 13, 1, 39.99),
-- Order 10: laptop + phone + earbuds
(10, 10, 1, 599.99),
(10, 8, 1, 799.99),
(10, 11, 1, 79.99);
