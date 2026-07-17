#1. Install MySQL or PostgreSQL on your system and create a new database named 'music_streaming_app' using the command line or GUI tool of your choice.
CREATE DATABASE music_streaming_app;
USE music_streaming_app;

#2.Inside the 'music_streaming_app' database, create a table called 'playlists' with columns: playlist_id (integer, primary key), name (varch
CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    name VARCHAR(100),
    created_by VARCHAR(100)
);
#3.Insert three sample rows into the 'playlists' table representing playlists like 'Bollywood Hits', 'Chill Vibes', and 'Workout Mix', each created by a different user.
INSERT INTO playlists (playlist_id, name, created_by)
VALUES
(1, 'Bollywood Hits', 'Amit'),
(2, 'Chill Vibes', 'Priya'),
(3, 'Workout Mix', 'Rahul');


#4. Write an SQL SELECT query to display all playlists created by the user 'Amit' from the 'playlists' table.<br><br><em><strong>Hint:</strong> Use the WHERE clause to filter by the 'created_by' column.</em>
SELECT *
FROM playlists
WHERE created_by = 'Amit';

#5.Open ChatGPT or Copilot and ask it to explain the difference between a table, a row, and a column in SQL using an example from a food delivery app like Zomato. Paste the explanation you receive into your assignment.
food delivery app like Zomato that stores information about restaurants.

Table: A table is a collection of related data. For example, a restaurants table stores details of all restaurants available on the app.
Row: A row represents one complete record in the table. For example, one row could contain the details of a single restaurant such as Pizza Hub, its location, and rating.
Column: A column represents a specific type of information for every record. In the restaurants table, columns could include restaurant_id, restaurant_name, location, and rating.





















