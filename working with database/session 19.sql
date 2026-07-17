#1. Write an SQL query to find the top 5 highest-rated restaurants in Koramangala that serve North Indian cuisine, using the Zomato Bangalore dataset.
SELECT
    name,
    location,
    cuisines,
    rate
FROM zomato
WHERE location LIKE '%Koramangala%'
  AND cuisines LIKE '%North Indian%'
ORDER BY rate DESC
LIMIT 5;
#2.Using SQL, calculate the average cost for two people for each cuisine type and list the 3 most expensive cuisines to eat in Bangalore.
SELECT
    cuisines,
    AVG(`approx_cost(for two people)`) AS average_cost
FROM zomato
GROUP BY cuisines
ORDER BY average_cost DESC
LIMIT 3;
#3. Find all restaurants that offer online delivery but have a rating below 3.0, and suggest a marketing strategy to improve their ratings based on your findings.<br><br><em><strong>Hint:</strong> Look for patterns in location, cuisine, or price that might explain the low ratings.</em>
SELECT
    name,
    location,
    cuisines,
    rate,
    `approx_cost(for two people)`
FROM zomato
WHERE online_order = 'Yes'
  AND rate < 3.0;
  #4. Write an SQL query to segment restaurants into three market segments based on average cost for two: budget (below 400), mid-range (400-800), and premium (above 800). Count how many restaurants fall into each segment.
  SELECT
    CASE
        WHEN `approx_cost(for two people)` < 400 THEN 'Budget'
        WHEN `approx_cost(for two people)` BETWEEN 400 AND 800 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS market_segment,
    COUNT(*) AS restaurant_count
FROM zomato
GROUP BY market_segment;
#5.Use ChatGPT or Copilot to help you write an SQL query that lists the top 10 most popular restaurant chains (by number of outlets) in the dataset, then run and validate the query yourself.<br><br><em><strong>Hint:</strong> Search for 'SQL group by count example' if you get stuck.</em>
SELECT
    name,
    COUNT(*) AS total_outlets
FROM zomato
GROUP BY name
ORDER BY total_outlets DESC
LIMIT 10;