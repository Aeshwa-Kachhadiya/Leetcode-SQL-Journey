-- Problem ID: 595
-- Title: Big Countries
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the name, population, and area of countries that are considered "big".
--
-- A country is considered big if:
-- 1) Its area is at least 3,000,000 km², OR
-- 2) Its population is at least 25,000,000.
--
-- Table Description:
-- World
-- | name | continent | area | population | gdp |
--
-- Task Requirements:
-- - Select the name, population, and area columns
-- - Include countries where area >= 3,000,000
-- - OR population >= 25,000,000
-- - Return the result in any order
--
-- Approach:
-- - Use SELECT to retrieve the required columns
-- - Apply a WHERE clause to filter big countries
-- - Use OR to include countries satisfying either condition
--
-- SQL Solution:

SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
