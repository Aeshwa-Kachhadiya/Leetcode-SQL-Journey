-- Problem ID: 1978
-- Title: Employees Whose Manager Left the Company
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the IDs of employees whose salary is strictly less than $30000
-- and whose manager has left the company (manager_id no longer exists in the table).
-- Return results ordered by employee_id.
--
-- Table Description:
-- Employees
-- | employee_id | name | manager_id | salary |
-- employee_id is the primary key
-- manager_id is NULL if the employee has no manager
-- When a manager leaves, their record is deleted but reports still reference their ID
--
-- Approach:
-- - Filter employees with salary < 30000
-- - Exclude employees with NULL manager_id (they never had a manager)
-- - Use NOT IN subquery to check if manager_id no longer exists in the table
--   as an employee_id (meaning the manager has left the company)
-- - Order the result by employee_id ascending
--
-- SQL Solution:
SELECT employee_id
FROM Employees
WHERE salary < 30000
AND manager_id IS NOT NULL
AND manager_id NOT IN (
    SELECT employee_id FROM Employees
)
ORDER BY employee_id ASC;
