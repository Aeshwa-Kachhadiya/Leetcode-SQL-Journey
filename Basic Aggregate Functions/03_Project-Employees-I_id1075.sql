-- Problem ID: 1075
-- Title: Project Employees I
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the average experience years of employees working on each project.
-- The result should be rounded to 2 decimal places.
--
-- Table Description:
-- Project
-- | project_id | employee_id |
--
-- Employee
-- | employee_id | name | experience_years |
--
-- Task Requirements:
-- - Combine the Project and Employee tables
-- - Get the experience_years of employees working on each project
-- - Calculate the average experience years for each project
-- - Round the result to 2 decimal places
--
-- Approach:
-- - Use INNER JOIN to combine Project and Employee tables using employee_id
-- - Each row represents an employee working on a project
-- - Use AVG() to compute the average experience years
-- - Use GROUP BY project_id to calculate the average for each project
-- - Round the result using ROUND(..., 2)
--
-- SQL Solution:
SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;
