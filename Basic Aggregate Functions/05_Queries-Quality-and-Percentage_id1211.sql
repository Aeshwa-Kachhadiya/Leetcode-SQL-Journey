-- Problem ID: 1211
-- Title: Queries Quality and Percentage
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- For each query_name, calculate:
-- 1) Query quality: the average of (rating / position)
-- 2) Poor query percentage: percentage of queries with rating less than 3
--
-- Both results should be rounded to 2 decimal places.
--
-- Table Description:
-- Queries
-- | query_name | result | position | rating |
--
-- Task Requirements:
-- - Compute the average value of (rating / position) for each query_name
-- - Count how many queries have rating < 3 (poor queries)
-- - Calculate the percentage of poor queries for each query_name
-- - Round both results to 2 decimal places
-- - Return the results for each query_name
--
-- Approach:
-- - Use AVG(rating/position) to compute query quality
-- - Use COUNT(IF(rating < 3, 1, NULL)) to count poor queries
-- - Divide the poor query count by total queries to get the percentage
-- - Multiply by 100 to convert to percentage
-- - Use ROUND(...,2) to keep two decimal places
-- - Group results by query_name
--
-- SQL Solution:
SELECT 
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(COUNT(IF(rating < 3, 1, NULL)) / COUNT(rating) * 100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
