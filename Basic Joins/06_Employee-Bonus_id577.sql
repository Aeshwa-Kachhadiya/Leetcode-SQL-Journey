-- Problem ID: 577
-- Title: Employee Bonus
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Report the name and bonus of each employee who either has a bonus
-- less than 1000 or did not receive any bonus at all.
--
-- Table Description:
-- Employee
-- | empId | name | supervisor | salary |
--
-- Bonus
-- | empId | bonus |
--
-- Task Requirements:
-- - Find employees with bonus less than 1000
-- - Also include employees who have no bonus at all (NULL)
-- - Return name and bonus columns
-- - Return result in any order
--
-- Approach:
-- - Use LEFT JOIN to keep all employees even if they have no entry in Bonus table
-- - Employees with no bonus will have NULL in the bonus column
-- - WHERE clause filters employees with bonus < 1000 OR bonus IS NULL
-- - OR condition is necessary to capture both cases in one query

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;
