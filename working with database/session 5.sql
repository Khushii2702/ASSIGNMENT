#1. Create a table called Restaurants with columns: id, name, cuisine, rating, and city. Insert at least 5 sample records representing real or fictional restaurants you might find on Zomato.
CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    city VARCHAR(50)
);
INSERT INTO Restaurants (id, name, cuisine, rating, city)
VALUES
(1, 'Swagat Restaurant', 'North Indian', 4.5, 'Ahmedabad'),
(2, 'Swadisht Cafe', 'South Indian', 4.2, 'Surat'),
(3, 'Pizza Palace', 'Italian', 4.7, 'Ahmedabad'),
(4, 'Dragon Bowl', 'Chinese', 3.8, 'Vadodara'),
(5, 'Spice Hub', 'Gujarati', 4.1, 'Surat');
#2. Write a SQL query to find all restaurants in the Restaurants table that have a rating greater than 4.0 and are located in either 'Ahmedabad' or 'Surat'.
SELECT *
FROM Restaurants
WHERE rating > 4.0
  AND city IN ('Ahmedabad', 'Surat');
  #3.Using the LIKE operator, write a query to select all restaurants whose names start with 'Swa' (for example, 'Swagat', 'Swadisht') from the Restaurants table.<br><br><em><strong>Hint:</strong> Use LIKE 'Swa%'.</em>
  SELECT *
FROM Restaurants
WHERE name LIKE 'Swa%';
#4. Write a SQL query using the BETWEEN keyword to find all restaurants in the Restaurants table with a rating between 3.5 and 4.5 (inclusive).
SELECT *
FROM Restaurants
WHERE rating BETWEEN 3.5 AND 4.5;
#5. Write a query to find all restaurants whose cuisine is either 'Chinese', 'Italian', or 'South Indian' using the IN operator.
SELECT *
FROM Restaurants
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');