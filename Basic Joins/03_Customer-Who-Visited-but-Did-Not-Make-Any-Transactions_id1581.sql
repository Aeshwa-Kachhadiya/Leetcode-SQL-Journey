-- Problem ID: 1581
-- Title: Customer Who Visited but Did Not Make Any Transactions
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the IDs of users who visited without making any transactions
-- and the number of times they made these types of visits.
--
-- Table Description:
-- Visits
-- | visit_id | customer_id |
--
-- Transactions
-- | transaction_id | visit_id | amount |
--
-- Task Requirements:
-- - Find customers who visited but made NO transactions
-- - Count how many times each customer made such visits
-- - Return result in any order
--
-- Approach:
-- - Use LEFT JOIN to keep all visits even if no matching transaction exists
-- - Visits with no transactions will have NULL in transaction columns
-- - Filter using WHERE t.visit_id IS NULL to get only non-transactional visits
-- - GROUP BY customer_id and COUNT to get the number of such visits per customer

SELECT v.customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY customer_id;
