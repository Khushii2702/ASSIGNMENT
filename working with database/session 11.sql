#1. Create a SQL query using a subquery in the WHERE clause to find all restaurants from a 'Restaurants' table whose average rating is higher than the average rating of all restaurants in the city.
DESCRIBE Restaurants;
SHOW COLUMNS FROM Restaurants;
SELECT name
FROM Restaurants
WHERE rating >
(
    SELECT AVG(rating)
    FROM Restaurants
);
SELECT name
FROM Restaurants;
SELECT * FROM Restaurants; 
#2. Write a SQL query that uses a subquery in the SELECT statement to display each user's name from a 'Users' table along with the total number of orders they have placed from an 'Orders' table, like a summary you might see in a Zomato user profile.
SELECT
    u.user_name,
    (
        SELECT COUNT(*)
        FROM Orders o
        WHERE o.user_id = u.user_id
    ) AS total_orders
FROM Users u;
#3 Given a 'Movies' table and a 'Reviews' table, write a SQL query using IN with a subquery to list all movies that have at least one review with a rating of 5 stars, as seen in BookMyShow's top-rated section.
SELECT movie_name
FROM Movies
WHERE movie_id IN
(
    SELECT movie_id
    FROM Reviews
    WHERE rating = 5
);
#4. Write a nested SQL query to find the names of all sellers from a 'Sellers' table on a Flipkart-style platform who have sold products in every category listed in a 'Categories' table.<br><br><em><strong>Hint:</strong> Use nested subqueries to compare seller's categories with the complete list of categories.</em>
SELECT seller_name
FROM Sellers s
WHERE NOT EXISTS
(
    SELECT category_id
    FROM Categories c
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM Products p
        WHERE p.seller_id = s.seller_id
          AND p.category_id = c.category_id
    )
);

