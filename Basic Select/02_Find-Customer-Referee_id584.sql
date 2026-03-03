-- Problem ID: 584
-- Title: Find Customer Referee
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the names of customers who are either:
-- 1) Referred by a customer whose id is NOT equal to 2, OR
-- 2) Not referred by any customer.
--
-- Table Description:
-- Customer
-- | id | name | referee_id |
--
-- Task Requirements:
-- - Exclude customers referred by customer with id = 2
-- - Include customers with no referee (referee_id IS NULL)
-- - Return only the name column
--
-- Approach:
-- - Use WHERE clause to filter records
-- - Apply OR condition to include both valid cases
-- - Use IS NULL to handle customers without a referee
--
-- SQL Solution:

SELECT name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;
