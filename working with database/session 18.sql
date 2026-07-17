#1. Write an SQL query to display the total number of songs uploaded by each artist from a table 'songs' (columns: song_id, artist_name, title) and show only those artists who have uploaded more than 3 songs.
SELECT
    artist_name,
    COUNT(song_id) AS total_songs
FROM songs
GROUP BY artist_name
HAVING COUNT(song_id) > 3;
#2. Given two tables, 'orders' (order_id, user_id, amount) and 'users' (user_id, username), write a SQL JOIN query to display each username along with their total order amount.
SELECT
    u.username,
    SUM(o.amount) AS total_order_amount
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY
    u.user_id,
    u.username;
#3. Write a SQL subquery to find the names of all restaurants from a 'restaurants' table (id, name, rating) whose rating is higher than the average rating of all restaurants.
SELECT
    name,
    rating
FROM restaurants
WHERE rating >
(
    SELECT AVG(rating)
    FROM restaurants
);
#4. Using a 'transactions' table (id, user_id, amount, transaction_date), write a SQL query with a window function to display each user's transaction amount and their running total (cumulative sum) ordered by transaction_date.
SELECT
    id,
    user_id,
    transaction_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY user_id
        ORDER BY transaction_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM transactions;
#5.List two optimizations you would apply to speed up a query that filters Flipkart products by category and price, and briefly explain how each helps.<br><br><em><strong>Hint:</strong> Think about indexes and query structure.</em>
CREATE INDEX idx_category_price
ON Products(category, price);
SELECT *
FROM Products
WHERE category = 'Mobiles'
  AND price < 30000;