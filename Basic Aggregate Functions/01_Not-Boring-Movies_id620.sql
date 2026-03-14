-- Problem ID: 620
-- Title: Not Boring Movies
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find movies that have an odd-numbered ID and a description that is not "boring".
--
-- Table Description:
-- Cinema
-- | id | movie | description | rating |
--
-- Task Requirements:
-- - Select movies where the id is odd
-- - Exclude movies where the description is "boring"
-- - Return all columns
-- - Order the result by rating in descending order
--
-- Approach:
-- - Use the modulo operator (%) to check if the id is odd (id % 2 = 1)
-- - Use a WHERE condition to filter out rows where description = "boring"
-- - Sort the results using ORDER BY rating in descending order
--
-- SQL Solution:
SELECT *
FROM Cinema
WHERE id % 2 = 1
AND description != 'boring'
ORDER BY rating DESC;
