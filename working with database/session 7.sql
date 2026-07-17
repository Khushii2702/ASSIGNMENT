#1.Create a table called Orders with columns: order_id, user_name, total_amount, and order_date. Insert 5 sample rows with different users and order amounts, including at least one NULL value for total_amount.
SHOW TABLES;
DESCRIBE Orders;
SHOW CREATE TABLE Orders;
SELECT * FROM Orders;
CREATE TABLE Orders_Assignment (
    order_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    total_amount DECIMAL(10,2),
    order_date DATE
);
INSERT INTO Orders_Assignment (order_id, user_name, total_amount, order_date)
VALUES
(1, 'Amit', 1200.50, '2026-07-01'),
(2, 'Priya', 850.00, '2026-07-02'),
(3, 'Rahul', NULL, '2026-07-03'),
(4, 'Amit', 1500.75, '2026-07-04'),
(5, 'Sneha', 950.25, '2026-07-05');
#2Write a SQL query to count how many orders were placed by each user in the Orders table, displaying user_name and the number of orders as order_count.
CREATE TABLE Orders_Sales (
    order_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    total_amount DECIMAL(10,2),
    order_date DATE
);
INSERT INTO Orders_Sales
(order_id, user_name, total_amount, order_date)
VALUES
(1, 'Amit', 1200.50, '2026-07-01'),
(2, 'Priya', 850.00, '2026-07-02'),
(3, 'Rahul', NULL, '2026-07-03'),
(4, 'Amit', 1500.75, '2026-07-04'),
(5, 'Sneha', 950.25, '2026-07-05');
SELECT
    user_name,
    COUNT(*) AS order_count
FROM Orders_Sales
GROUP BY user_name;
#3 Write a SQL query to calculate the average total_amount of all orders in the Orders table, making sure to ignore any NULL values.
DESCRIBE Orders;
SELECT AVG(amount) AS average_order_amount
FROM Orders;
SELECT AVG(total_amount) AS average_order_amount
FROM Orders_Sales;
#4.Suppose you are building a Flipkart-style dashboard: Write a SQL query to find the highest and lowest order amounts (MAX and MIN) from the Orders table, and display both values in a single result row.
DESCRIBE Orders;
SELECT
    MAX(amount) AS highest_order_amount,
    MIN(amount) AS lowest_order_amount
FROM Orders;
SELECT
    MAX(total_amount) AS highest_order_amount,
    MIN(total_amount) AS lowest_order_amount
FROM Orders_Sales;
#5Write a SQL query to calculate the total sales (SUM of total_amount) for all orders, but only include orders where total_amount is not NULL.<br><br><em><strong>Hint:</strong> Use a WHERE clause to filter out NULL values before applying the SUM function.</em>

DESCRIBE Orders;
SHOW COLUMNS FROM Orders;
SELECT SUM(amount) AS total_sales
FROM Orders
WHERE amount IS NOT NULL;