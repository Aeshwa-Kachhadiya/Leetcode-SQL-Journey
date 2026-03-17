-- Problem ID: 1907
-- Title: Count Salary Categories
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Calculate the number of bank accounts that fall into each salary category.
--
-- Table Description:
-- Accounts
-- | account_id | income |
--
-- Note:
-- account_id is the primary key.
-- income represents the monthly income of a bank account.
--
-- Task Requirements:
-- - Categorize accounts into three salary groups:
--     1. "Low Salary"     → income < 20000
--     2. "Average Salary" → income between 20000 and 50000 (inclusive)
--     3. "High Salary"    → income > 50000
-- - Return the count of accounts in each category
-- - The result must always include all three categories
-- - If a category has no accounts, return 0
--
-- Approach:
-- - Use COUNT() with CASE WHEN to conditionally count rows
-- - CASE WHEN returns 1 when the condition is satisfied
-- - COUNT() counts non-null values, effectively counting matching rows
-- - Each SELECT statement calculates the count for one salary category
-- - UNION ALL combines the three result rows into one result set
--
-- Example Logical Breakdown:
--
-- Category Evaluation
--
-- Low Salary
-- income < 20000 → 1 account
--
-- Average Salary
-- income between 20000 and 50000 → 1 account
--
-- High Salary
-- income > 50000 → 1 account
--
-- UNION ALL Syntax Used:
-- UNION ALL combines multiple SELECT results into a single output
-- It keeps all rows (including duplicates) and is faster than UNION

SELECT 'Low Salary' AS category,
       COUNT(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts

UNION ALL

SELECT 'Average Salary' AS category,
       COUNT(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END)
FROM Accounts

UNION ALL

SELECT 'High Salary' AS category,
       COUNT(CASE WHEN income > 50000 THEN 1 ELSE 0 END)
FROM Accounts;
