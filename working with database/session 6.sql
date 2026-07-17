#1.Write an SQL query to display all products from a 'products' table and sort them by price in ascending order, similar to how Flipkart lists items from lowest to highest price.
SHOW TABLES;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);
INSERT INTO products (product_id, product_name, price, category)
VALUES
(1, 'Wireless Mouse', 599.00, 'Electronics'),
(2, 'Bluetooth Speaker', 2499.00, 'Electronics'),
(3, 'Notebook', 99.00, 'Stationery'),
(4, 'Laptop', 55999.00, 'Electronics'),
(5, 'Office Chair', 7999.00, 'Furniture');
SELECT *
FROM products
ORDER BY price ASC;
#2Modify your previous query to show the top 5 most expensive products using ORDER BY with DESC and LIMIT.
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;
#3Given a 'movies' table with columns 'title', 'release_year', and 'rating', write an SQL query to list all movies sorted first by release_year in descending order (latest first), then by rating in descending order (highest rated first).
CREATE TABLE movies (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    release_year INT,
    rating DECIMAL(2,1)
);
INSERT INTO movies (id, title, release_year, rating)
VALUES
(1, '3 Idiots', 2009, 8.4),
(2, 'Pushpa', 2021, 7.6),
(3, 'KGF Chapter 2', 2022, 8.3),
(4, 'Jawan', 2023, 7.2),
(5, 'Stree 2', 2024, 8.1);
SELECT *
FROM movies
ORDER BY release_year DESC, rating DESC;
#4 Write an SQL query to display the first 10 restaurants from a 'restaurants' table, sorted alphabetically by name, just like Zomato's A-Z listing.<br><br><em><strong>Hint:</strong> Use ORDER BY with LIMIT.</em>
SELECT *
FROM restaurants
ORDER BY name ASC
LIMIT 10;
#5 Suppose you want to display the top 3 trending songs from a 'songs' table based on play_count, but if two songs have the same play_count, the more recently added song should come first. Write the SQL query to achieve this.<br><br><em><strong>Hint:</strong> Use ORDER BY with multiple columns.</em>
CREATE TABLE songs (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    play_count INT,
    added_date DATE
);
INSERT INTO songs (id, song_name, artist, play_count, added_date)
VALUES
(1, 'Brown Munde', 'AP Dhillon', 1500, '2026-07-10'),
(2, 'Kesariya', 'Arijit Singh', 1200, '2026-07-12'),
(3, 'Blinding Lights', 'The Weeknd', 1800, '2026-07-11'),
(4, 'Perfect', 'Ed Sheeran', 1800, '2026-07-14'),
(5, 'Levitating', 'Dua Lipa', 900, '2026-07-09');
SELECT *
FROM songs
ORDER BY play_count DESC, added_date DESC
LIMIT 3;