#1. Create two tables: Influencers (id, name) and Collaborations (id, influencer1_id, influencer2_id, collab_date). Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations.
CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Collaborations (
    id INT PRIMARY KEY,
    influencer1_id INT,
    influencer2_id INT,
    collab_date DATE
);
SHOW TABLES;
CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
SELECT DATABASE();
SHOW TABLES;
DESCRIBE Influencers;
DESCRIBE Collaborations;
SELECT * FROM Influencers;
SELECT * FROM Collaborations;
SELECT
    i1.name AS influencer_name,
    i2.name AS collaboration_partner,
    c.collab_date
FROM Collaborations c
LEFT JOIN Influencers i1
    ON c.influencer1_id = i1.id
LEFT JOIN Influencers i2
    ON c.influencer2_id = i2.id;
#2, Create two tables: Influencers (id, name) and Collaborations (id, influencer1_id, influencer2_id, collab_date). Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations.
SELECT
    p1.playlist_name AS playlist,
    p2.playlist_name AS parent_playlist
FROM Playlists p1
LEFT JOIN Playlists p2
ON p1.parent_playlist_id = p2.id;
#3.Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount), write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users even if they have no orders or payments.
SELECT
    u.username,
    o.order_date,
    p.amount
FROM Users u
LEFT JOIN Orders o
ON u.id = o.user_id
LEFT JOIN Payments p
ON o.id = p.order_id;
#4. You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows for some restaurants. Modify your query to eliminate duplicates and explain in one line why the duplicates were happening.<br><br><em><strong>Hint:</strong> Use DISTINCT or GROUP BY and consider the relationship between restaurants and reviews.</em>
SELECT DISTINCT
    r.id,
    r.name
FROM Restaurants r
INNER JOIN Reviews rv
ON r.id = rv.restaurant_id;
#5. Write two different JOIN queries on a Products and Categories table (like Flipkart) to list all products with their category names, but use different join conditions in each. Briefly explain which join condition is more efficient and why.
SELECT
    p.product_name,
    c.category_name
FROM Products p
INNER JOIN Categories c
ON p.category_id = c.category_id;