-- Problem ID: 619
-- Title: Biggest Single Number
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- A single number is defined as a number that appears only once
-- in the MyNumbers table. Find the largest single number.
-- If no such number exists, return NULL.
--
-- Table Description:
-- MyNumbers
-- | num |
--
-- Note:
-- The table may contain duplicate numbers and does not have a primary key.
--
-- Task Requirements:
-- - Identify numbers that appear exactly once in the table
-- - Among those numbers, return the largest one
-- - If no number appears exactly once, return NULL
--
-- Approach:
-- - Use GROUP BY num to group identical numbers together
-- - Use HAVING COUNT(num) = 1 to keep only numbers that appear once
-- - Use a subquery to get all single numbers
-- - Apply MAX(num) on the result to find the largest single number

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) AS temp;
