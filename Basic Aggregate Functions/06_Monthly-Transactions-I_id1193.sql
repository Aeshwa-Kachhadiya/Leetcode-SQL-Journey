-- Problem ID: 1193
-- Title: Monthly Transactions I
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- For each month and country, find:
-- 1) The number of transactions and their total amount
-- 2) The number of approved transactions and their total amount
--
-- Table Description:
-- Transactions
-- | id | country | state | amount | trans_date |
-- state is an enum of type ["approved", "declined"]
--
-- Task Requirements:
-- - Group transactions by month (YYYY-MM format) and country
-- - Count total number of transactions per group
-- - Sum total amount of transactions per group
-- - Count only approved transactions per group
-- - Sum amount of only approved transactions per group
-- - Return results in any order
--
-- Approach:
-- - Use DATE_FORMAT(trans_date, '%Y-%m') to extract the year-month
-- - Use COUNT(id) to get total transaction count
-- - Use SUM(amount) to get total transaction amount
-- - Use SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END) to count approved transactions
-- - Use SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) to sum approved amounts
-- - Group by the formatted month and country
--
-- SQL Solution:
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country;
