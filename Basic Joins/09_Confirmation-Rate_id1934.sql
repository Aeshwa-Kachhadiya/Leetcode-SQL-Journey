-- Problem ID: 1934
-- Title: Confirmation Rate
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Find the confirmation rate of each user, defined as the number of
-- 'confirmed' messages divided by total confirmation requests.
-- Users with no confirmation requests should have a rate of 0.
-- Round the result to 2 decimal places.
--
-- Table Description:
-- Signups
-- | user_id | time_stamp |
--
-- Confirmations
-- | user_id | time_stamp | action |
--
-- Task Requirements:
-- - Calculate confirmation rate for every user in Signups table
-- - Confirmation rate = confirmed messages / total messages
-- - Users with no confirmation requests should show 0 (not NULL)
-- - Round result to 2 decimal places
-- - Return result in any order
--
-- Approach:
-- - Use LEFT JOIN to keep all users from Signups even with no Confirmations
-- - SUM(c.action='confirmed') counts only 'confirmed' rows (boolean 1/0 trick)
-- - COUNT(action) counts total confirmation requests per user
-- - IFNULL handles users with no requests, replacing NULL with 0
-- - GROUP BY user_id to aggregate per user

SELECT s.user_id, ROUND(IFNULL(SUM(c.action = 'confirmed') / COUNT(action), 0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY user_id;
