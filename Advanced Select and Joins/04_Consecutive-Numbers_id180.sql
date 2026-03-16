-- Problem ID: 180
-- Title: Consecutive Numbers
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Find all numbers that appear at least three times consecutively.
--
-- Table Description:
-- Logs
-- | id  | num |
--
-- Note:
-- id is the primary key and an autoincrement column starting from 1.
-- Consecutive means appearing in back-to-back rows by id order.
--
-- Task Requirements:
-- - Find numbers that appear at least 3 times in a row
-- - Return only distinct numbers to avoid duplicates
-- - Return result in any order
--
-- Approach:
-- - Use LAG() window function to look back at previous rows
-- - LAG(num, 1) → fetches the value from 1 row behind (previous row)
-- - LAG(num, 2) → fetches the value from 2 rows behind (row before previous)
-- - ORDER BY id ensures we look at rows in their natural sequence
-- - Inner Query builds a view with current row and its 2 previous values:
--     num  | prev1 | prev2
--     -----+-------+------
--      1   |  null | null
--      1   |   1   | null
--      1   |   1   |  1   ← all three match!
--      2   |   1   |  1
-- - Outer Query filters rows where all three values are equal:
--     num = prev1 AND num = prev2
-- - DISTINCT is used because the same number could satisfy the
--   condition across multiple rows and we only want it once
--
-- LAG() Syntax Used:
--   LAG(column, offset) OVER(ORDER BY column)
--   ├── column     → which value to look back at
--   ├── offset     → how many rows back to look
--   ├── OVER()     → marks this as a window function
--   └── ORDER BY   → defines the sequence of rows
SELECT DISTINCT(num) AS ConsecutiveNums
FROM (
    SELECT
        num,
        LAG(num, 1) OVER(ORDER BY id) AS prev1,
        LAG(num, 2) OVER(ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1
  AND num = prev2;
