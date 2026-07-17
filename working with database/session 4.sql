#1Create a table named MusicPlaylist with columns: id, song_name, artist, genre, and duration. Insert at least 5 records representing songs from your favorite Spotify playlist, then write a SELECT statement to retrieve all columns for all songs.
CREATE TABLE MusicPlaylist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    genre VARCHAR(50),
    duration TIME
);
INSERT INTO MusicPlaylist (id, song_name, artist, genre, duration)
VALUES
(1, 'Kesariya', 'Arijit Singh', 'Bollywood', '00:04:28'),
(2, 'Perfect', 'Ed Sheeran', 'Pop', '00:04:23'),
(3, 'Blinding Lights', 'The Weeknd', 'Pop', '00:03:20'),
(4, 'Believer', 'Imagine Dragons', 'Rock', '00:03:24'),
(5, 'Levitating', 'Dua Lipa', 'Pop', '00:03:23');
SELECT * FROM MusicPlaylist;
#2. Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table, showing just the first 3 records using the LIMIT keyword.
SELECT song_name, artist
FROM MusicPlaylist
LIMIT 3;
#3. Suppose you have a table named FoodOrders with columns: id, restaurant, food_item, and order_date. Write a SQL query to list all unique restaurant names where you have placed orders, using the DISTINCT keyword.
SELECT DISTINCT restaurant
FROM FoodOrders;

SELECT
    food_item AS 'Dish',
    order_date AS 'Date Ordered'
FROM FoodOrders;






