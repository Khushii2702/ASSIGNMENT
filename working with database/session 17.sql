#1.Create a SQL table called Restaurant with columns: id, name, cuisine, location, and average_rating. Insert at least 5 sample rows representing popular restaurants from Zomato.
CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    location VARCHAR(100),
    average_rating DECIMAL(3,2)
);

INSERT INTO Restaurant (id, name, cuisine, location, average_rating) VALUES
(1, 'Barbeque Nation', 'North Indian', 'Ahmedabad', 4.50),
(2, 'The Pizza Hub', 'Italian', 'Ahmedabad', 4.30),
(3, 'Mainland China', 'Chinese', 'Mumbai', 4.60),
(4, 'Bawarchi', 'Hyderabadi', 'Hyderabad', 4.40),
(5, 'Sankalp', 'South Indian', 'Ahmedabad', 4.20);
#2. Write a SQL query to generate a report showing the number of restaurants for each cuisine type from your Restaurant table, ordered by the count in descending order.<br><br><em><strong>Hint:</strong> Use GROUP BY and ORDER BY.</em>
SELECT
    cuisine,
    COUNT(*) AS restaurant_count
FROM Restaurant
GROUP BY cuisine
ORDER BY restaurant_count DESC;
#3. Add a new table called Review with columns: id, restaurant_id, user_name, rating, and review_date. Insert at least 10 sample reviews, linking them to restaurants using restaurant_id.
CREATE TABLE Review (
    id INT PRIMARY KEY,
    restaurant_id INT,
    user_name VARCHAR(100),
    rating DECIMAL(2,1),
    review_date DATE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(id)
);

INSERT INTO Review (id, restaurant_id, user_name, rating, review_date) VALUES
(1, 1, 'Amit', 5.0, '2026-07-01'),
(2, 1, 'Priya', 4.5, '2026-07-02'),
(3, 2, 'Rahul', 4.0, '2026-07-03'),
(4, 2, 'Sneha', 4.5, '2026-07-04'),
(5, 3, 'Rohan', 5.0, '2026-07-05'),
(6, 3, 'Anjali', 4.5, '2026-07-06'),
(7, 4, 'Vikas', 4.0, '2026-07-07'),
(8, 4, 'Neha', 4.5, '2026-07-08'),
(9, 5, 'Karan', 4.0, '2026-07-09'),
(10, 5, 'Meera', 4.5, '2026-07-10');
#4.Write a SQL query using a JOIN to display each restaurant's name, cuisine, and its average review rating (from the Review table), ordered by highest average rating first.<br><br><em><strong>Hint:</strong> Use JOIN and GROUP BY with aggregate functions.</em>
SELECT
    r.name,
    r.cuisine,
    AVG(rv.rating) AS average_review_rating
FROM Restaurant r
JOIN Review rv
ON r.id = rv.restaurant_id
GROUP BY
    r.id,
    r.name,
    r.cuisine
ORDER BY average_review_rating DESC;
#5. Use a window function to rank restaurants by their average review rating within each cuisine type, showing the restaurant name, cuisine, average rating, and rank.<br><br><em><strong>Hint:</strong> Use the RANK() or DENSE_RANK() window function partitioned by cuisine.</em>
SELECT
    name,
    cuisine,
    average_rating,
    RANK() OVER (
        PARTITION BY cuisine
        ORDER BY average_rating DESC
    ) AS cuisine_rank
FROM Restaurant;