-- Problem ID: 1484
-- Title: Group Sold Products By The Date
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find for each date the number of different products sold and their names.
-- The sold product names for each date should be sorted lexicographically.
-- Return the result ordered by sell_date.
--
-- Table Description:
-- Activities
-- | sell_date | product |
--
-- Note:
-- - No primary key, table may contain duplicates
-- - Each row contains product name and the date it was sold
--
-- Task Requirements:
-- - Count distinct products sold per date
-- - List product names sorted lexicographically
-- - Remove duplicate products for the same date
-- - Order final result by sell_date
--
-- Approach:
-- - GROUP BY sell_date to group records per date
-- - COUNT(DISTINCT product) to count unique products per date
-- - GROUP_CONCAT with DISTINCT and ORDER BY for sorted unique product names
-- - ORDER BY sell_date for final result ordering
--
-- Logic:
-- - GROUP BY sell_date groups all rows by date
-- - COUNT(DISTINCT product) ignores duplicate products in count
-- - GROUP_CONCAT(DISTINCT product ORDER BY product ASC) merges unique
--   product names into one string sorted lexicographically
-- - ORDER BY sell_date sorts the final result
--
-- SQL Solution:
SELECT sell_date,
       COUNT(DISTINCT product) AS num_sold,
       GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
