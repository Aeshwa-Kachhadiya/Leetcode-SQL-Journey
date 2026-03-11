-- Problem ID: 570
-- Title: Managers with at Least 5 Direct Reports
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Find managers who have at least 5 direct reports.
--
-- Table Description:
-- Employee
-- | id | name | department | managerId |
--
-- Task Requirements:
-- - Find employees who are managers of at least 5 other employees
-- - managerId is NULL if employee has no manager
-- - No employee is the manager of themselves
-- - Return result in any order
--
-- Approach:
-- - Self JOIN Employee table where e1.id matches e2.managerId
-- - This links each manager to all their direct reports
-- - GROUP BY managerId to aggregate reports per manager
-- - HAVING COUNT >= 5 filters only managers with at least 5 direct reports
-- - Select e1.name to get the manager's name from the joined row

SELECT e1.name
FROM Employee e1
JOIN Employee e2
ON e1.id=e2.managerId
GROUP BY e2.managerId
HAVING COUNT(e2.managerId)>=5
