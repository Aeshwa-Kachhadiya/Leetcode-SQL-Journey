-- Problem ID: 1731
-- Title: The Number of Employees Which Report to Each Employee
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Report the ids and names of all managers, the number of employees
-- who report directly to them, and the average age of the reports
-- rounded to the nearest integer.
--
-- Table Description:
-- Employees
-- | employee_id | name | reports_to | age |
--
-- Note:
-- employee_id is the column with unique values for this table.
-- reports_to contains the id of the manager the employee reports to.
-- Some employees do not report to anyone (reports_to is NULL).
-- A manager is defined as an employee who has at least 1 other
-- employee reporting to them.
--
-- Task Requirements:
-- - Find all employees who act as managers (have at least one report)
-- - Count the number of direct reports for each manager
-- - Calculate the average age of their reports, rounded to nearest integer
-- - Return result ordered by employee_id
--
-- Approach:
-- - Self JOIN Employees table: e1 as managers, e2 as their reports
-- - JOIN condition: e1.employee_id = e2.reports_to links each manager
--   to the employees who report to them
-- - The JOIN naturally filters out non-managers (no match = excluded)
-- - COUNT(e2.reports_to) counts the number of direct reports
-- - ROUND(AVG(e2.age)) computes the average age of those reports
-- - GROUP BY e1.employee_id aggregates results per manager
SELECT
    e1.employee_id,
    e1.name,
    COUNT(e2.reports_to) AS reports_count,
    ROUND(AVG(e2.age)) AS average_age
FROM Employees e1
JOIN Employees e2
    ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id
ORDER BY employee_id;
