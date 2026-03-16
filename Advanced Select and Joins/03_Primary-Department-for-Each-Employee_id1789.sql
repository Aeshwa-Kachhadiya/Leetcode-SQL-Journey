-- Problem ID: 1789
-- Title: Primary Department for Each Employee
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Report all employees with their primary department.
-- For employees who belong to only one department,
-- report their only department even if primary_flag is 'N'.
--
-- Table Description:
-- Employee
-- | employee_id | department_id | primary_flag |
--
-- Note:
-- (employee_id, department_id) is the primary key of this table.
-- primary_flag is an ENUM ('Y', 'N').
--   'Y' → this is the employee's primary department
--   'N' → this is not the primary department
-- When an employee belongs to only one department,
-- their primary_flag is still stored as 'N'.
--
-- Task Requirements:
-- - For employees with MULTIPLE departments → return the one with primary_flag = 'Y'
-- - For employees with only ONE department  → return that department (flag is 'N')
-- - Return result in any order
--
-- Approach:
-- - The challenge: we need per-group count (how many depts per employee)
--   BUT also need per-row detail (primary_flag) at the same time
--   → GROUP BY alone collapses rows and loses per-row details
--   → Window Function solves this perfectly
--
-- - Inner Query (Subquery):
--   Use COUNT(employee_id) OVER(PARTITION BY employee_id) to count
--   how many departments each employee belongs to, while keeping
--   all individual rows intact with their primary_flag values
--
-- - Outer Query (Filter):
--   Two conditions handle the two cases:
--     1. dept_count = 1  → employee has only 1 dept, return it regardless of flag
--     2. primary_flag = 'Y' → employee has multiple depts, return the primary one
--
-- Window Function Syntax Used:
--   COUNT(employee_id) OVER(PARTITION BY employee_id)
--   ├── COUNT()          → aggregate function
--   ├── OVER()           → marks this as a window function (no row collapsing)
--   └── PARTITION BY     → groups rows by employee_id (like GROUP BY but non-destructive)
SELECT
    employee_id,
    department_id
FROM (
    SELECT
        employee_id,
        department_id,
        primary_flag,
        COUNT(employee_id) OVER(PARTITION BY employee_id) AS dept_count
    FROM Employee
) AS t
WHERE dept_count = 1
   OR primary_flag = 'Y';
