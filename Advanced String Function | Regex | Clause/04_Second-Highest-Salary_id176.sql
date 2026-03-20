-- Problem ID: 176
-- Title: Second Highest Salary
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Find the second highest distinct salary from the Employee table.
-- If there is no second highest salary, return null.
--
-- Table Description:
-- Employee
-- | id | salary |
--
-- Note:
-- - id is the primary key
-- - Each row contains salary information of an employee
-- - If no second highest salary exists, return null
--
-- Task Requirements:
-- - Find the second highest DISTINCT salary
-- - Return null if no second highest salary exists
-- - Result column should be named SecondHighestSalary
--
-- Approach:
-- - Use a subquery wrapped in outer SELECT
-- - Use DISTINCT to handle duplicate salaries
-- - Use ORDER BY DESC to sort highest first
-- - Use LIMIT 1 OFFSET 1 to skip the highest and get the second
--
-- Logic:
-- - DISTINCT removes duplicate salary values
-- - ORDER BY salary DESC sorts from highest to lowest
-- - OFFSET 1 skips the 1st (highest) salary
-- - LIMIT 1 picks the next one (2nd highest)
-- - Wrapping in outer SELECT returns NULL automatically if no 2nd value exists
--
-- SQL Solution:
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;
