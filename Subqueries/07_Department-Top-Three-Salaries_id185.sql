-- Problem ID: 185
-- Title: Department Top Three Salaries
-- Platform: LeetCode
-- Difficulty: Hard
--
-- Problem Statement:
-- Find all employees who earn one of the top 3 unique salaries in their department.
-- A "high earner" is defined as an employee whose salary ranks within the top 3
-- unique salary values in their department.
-- Return Department name, Employee name, and Salary.
--
-- Table Description:
-- Employee   : | id | name | salary | departmentId |
-- Department : | id | name |
-- departmentId in Employee is a foreign key referencing id in Department
--
-- Approach:
-- - For each employee, count how many DISTINCT salaries in the same department
--   are strictly GREATER than their salary using a correlated subquery
-- - If that count is less than 3, the employee is in the top 3 unique salaries:
--     * count = 0 → employee has the highest salary
--     * count = 1 → employee has the 2nd highest salary
--     * count = 2 → employee has the 3rd highest salary
--     * count >= 3 → employee is out of top 3 ❌
-- - JOIN Employee with Department to get the department name
-- - No LIMIT needed since multiple employees can share the same salary rank
--
-- SQL Solution:
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
WHERE (
    SELECT COUNT(DISTINCT e2.salary)
    FROM Employee e2
    WHERE e2.departmentId = e.departmentId
    AND e2.salary > e.salary
) < 3;
