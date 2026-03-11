-- Problem ID: 197
-- Title: Rising Temperature
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find all dates' id with higher temperatures compared to the previous day.
--
-- Table Description:
-- Weather
-- | id | recordDate | temperature |
--
-- Task Requirements:
-- - Find ids where temperature is higher than the previous day
-- - Previous day means exactly 1 day before (yesterday)
-- - Return result in any order
--
-- Approach:
-- - Self JOIN the Weather table to compare each row with another row
-- - Use DATEDIFF to find rows that are exactly 1 day apart
-- - WHERE clause filters only those where today's temp > yesterday's temp
-- - DATEDIFF(w1.recordDate, w2.recordDate) = 1 ensures w1 is exactly 1 day after w2

SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;
