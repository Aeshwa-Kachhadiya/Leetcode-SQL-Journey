-- Problem ID: 585
-- Title: Investments in 2016
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Find the sum of tiv_2016 for all policyholders who:
-- 1) Share the same tiv_2015 value with at least one other policyholder
-- 2) Have a unique (lat, lon) location — not shared with any other policyholder
-- Round the result to 2 decimal places.
--
-- Table Description:
-- Insurance
-- | pid | tiv_2015 | tiv_2016 | lat | lon |
-- pid is the primary key
-- lat and lon are guaranteed to be NOT NULL
-- Each row represents a policyholder's investment values and city location
--
-- Approach:
-- Condition 1 (shared tiv_2015):
-- - GROUP BY tiv_2015 and use HAVING COUNT > 1
-- - Use IN to filter only those tiv_2015 values that appear more than once
--
-- Condition 2 (unique location):
-- - GROUP BY (lat, lon) and use HAVING COUNT(*) = 1
-- - Use IN to filter only those (lat, lon) pairs that appear exactly once
--
-- - Apply both conditions in the WHERE clause together
-- - SUM the tiv_2016 of the filtered rows and ROUND to 2 decimal places
--
-- SQL Solution:
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(tiv_2015) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
