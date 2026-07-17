#1. Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). Insert at least 3 restaurants and 2-3 dishes for each restaurant.
SHOW TABLES;
DESCRIBE restaurants;
SHOW CREATE TABLE restaurants;
CREATE TABLE restaurants_assignment (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE dishes (
    id INT PRIMARY KEY,
    restaurant_id INT,
    dish_name VARCHAR(100),
    price DECIMAL(10,2)
);
SELECT * FROM restaurants;
TRUNCATE TABLE restaurants;
INSERT INTO restaurants (id, name, city)
VALUES
(1, 'Swagat Restaurant', 'Ahmedabad'),
(2, 'Pizza Palace', 'Surat'),
(3, 'Dragon Bowl', 'Vadodara');
INSERT INTO dishes (id, restaurant_id, dish_name, price)
VALUES
(1, 1, 'Paneer Butter Masala', 280.00),
(2, 1, 'Butter Naan', 60.00),
(3, 2, 'Margherita Pizza', 350.00),
(4, 2, 'Garlic Bread', 180.00),
(5, 3, 'Hakka Noodles', 220.00),
(6, 3, 'Manchurian', 240.00);
#2. Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, similar to how Zomato shows dish details with the restaurant info.
SELECT
    d.dish_name,
    d.price,
    r.name AS restaurant_name,
    r.city
FROM dishes d
INNER JOIN restaurants r
ON d.restaurant_id = r.id;
#3. Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they currently have no dishes on the menu.<br><br><em><strong>Hint:</strong> Use LEFT JOIN so restaurants without dishes still appear in the results with NULL for dish columns.</em>
SELECT
    r.name AS restaurant_name,
    r.city,
    d.dish_name,
    d.price
FROM restaurants r
LEFT JOIN dishes d
ON r.id = d.restaurant_id;
#4. with an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might not be linked to a restaurant (simulate a data error where a dish has a restaurant_id that doesn't match any restaurant).
INSERT INTO dishes (id, restaurant_id, dish_name, price)
VALUES
(7, 10, 'Mystery Dish', 150.00);
SELECT
    d.dish_name,
    d.price,
    r.name AS restaurant_name
FROM restaurants r
RIGHT JOIN dishes d
ON r.id = d.restaurant_id;
#5. Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify. Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, and write the SQL query for it.
SHOW TABLES;
CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    playlist_id INT,
    song_name VARCHAR(100),
    artist VARCHAR(100)
);
INSERT INTO songs (song_id, playlist_id, song_name, artist)
VALUES
(1, 1, 'Kesariya', 'Arijit Singh'),
(2, 1, 'Tum Hi Ho', 'Arijit Singh'),
(3, 2, 'Brown Munde', 'AP Dhillon'),
(4, 3, 'Perfect', 'Ed Sheeran');
DESCRIBE playlists;
SELECT * FROM playlists;
DESCRIBE playlists;
SHOW COLUMNS FROM playlists;
DESCRIBE songs;
DESCRIBE playlists;
DESCRIBE songs;
SELECT
    p.name AS playlist_name,
    s.song_name
FROM playlists p
LEFT JOIN songs s
ON p.playlist_id = s.playlist_id;