-- Problem ID: 610
-- Title: Triangle Judgement
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Report for every three line segments whether they can form a triangle.
--
-- Table Description:
-- Triangle
-- | x | y | z |
--
-- Note:
-- (x, y, z) is the primary key of this table.
-- Each row contains the lengths of three line segments.
--
-- Task Requirements:
-- - For each row, determine if the three sides can form a valid triangle
-- - Output 'Yes' if they can form a triangle, 'No' otherwise
-- - Return the result in any order
--
-- Approach:
-- - Use the Triangle Inequality Theorem to validate each triplet
-- - A valid triangle must satisfy ALL three conditions simultaneously:
--     1. x + y > z
--     2. y + z > x
--     3. x + z > y
-- - Use IF(condition, 'Yes', 'No') to return the result inline
-- - IF() syntax: IF(condition, value_if_true, value_if_false)
-- - All three conditions are combined using AND, so if even one
--   condition fails, the result is 'No'
SELECT
    x,
    y,
    z,
    IF(x+y>z AND y+z>x AND x+z>y, 'Yes', 'No') AS triangle
FROM Triangle;
