-- Problem ID: 1633
-- Title: Percentage of Users Attended a Contest
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the percentage of users who registered in each contest.
-- The percentage should be rounded to 2 decimal places.
--
-- Table Description:
-- Users
-- | user_id | user_name |
--
-- Register
-- | contest_id | user_id |
--
-- Task Requirements:
-- - Count the number of users registered for each contest
-- - Find the total number of users
-- - Calculate the percentage of users registered in each contest
-- - Round the result to 2 decimal places
-- - Order the results by percentage in descending order
-- - If percentages are equal, order by contest_id in ascending order
--
-- Approach:
-- - Use GROUP BY contest_id to count registrations for each contest
-- - Use a subquery to get the total number of users from the Users table
-- - Compute percentage as (registered_users / total_users) * 100
-- - Use ROUND(..., 2) to format the percentage
-- - Sort results by percentage DESC and contest_id ASC
--
-- SQL Solution:
SELECT contest_id,
       ROUND(COUNT(user_id) / (SELECT COUNT(user_id) FROM Users) * 100, 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;
