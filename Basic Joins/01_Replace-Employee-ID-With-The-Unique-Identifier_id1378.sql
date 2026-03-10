-- Problem ID: 1378
-- Title: Replace Employee ID With The Unique Identifier
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Show the unique ID of each user.
-- If a user does not have a unique ID, show null instead.
--
-- Table Description:
-- Employees
-- | id | name |
--
-- EmployeeUNI
-- | id | unique_id |
--
-- Task Requirements:
-- - Show unique_id for each employee
-- - If no unique ID exists, return null
-- - Return the result in any order
--
-- Approach:
-- - Use LEFT JOIN to keep all employees from the Employees table
-- - Join with EmployeeUNI on matching id
-- - Employees without a match will automatically get null for unique_id
--
-- SQL Solution:
SELECT e2.unique_id, e1.name
FROM Employees e1
LEFT JOIN EmployeeUNI e2
ON e1.id = e2.id;
