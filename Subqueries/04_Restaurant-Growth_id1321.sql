-- Problem ID: 1321
-- Title: Restaurant Growth
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Compute the moving average of how much the customer paid in a seven days window
-- (i.e., current day + 6 days before).
-- average_amount should be rounded to two decimal places.
-- Return the result table ordered by visited_on in ascending order.
--
-- Table Description:
-- Customer
-- | customer_id | int     | Primary Key (with visited_on) |
-- | name        | varchar |                               |
-- | visited_on  | date    | Primary Key (with customer_id)|
-- | amount      | int     |                               |
--
-- Note:
-- - (customer_id, visited_on) is the composite primary key.
-- - There will be at least one customer every day.
-- - The 7-day window includes the current day and 6 days before it.
--
-- Task Requirements:
-- - Calculate total amount per day (multiple customers can visit on the same day)
-- - Compute 7-day rolling sum and rolling average over visited_on
-- - Round average_amount to 2 decimal places
-- - Return result ordered by visited_on ascending
-- - Skip the first 6 rows since they don't have a full 7-day window
--
-- Approach:
-- - GROUP BY visited_on to aggregate daily totals using SUM(amount)
-- - Use SUM(SUM(amount)) OVER (...) as a nested window function:
--     outer SUM = rolling window sum, inner SUM = daily aggregate
-- - Use ROWS BETWEEN 6 PRECEDING AND CURRENT ROW to define the 7-day window
-- - Apply the same window frame to AVG(...) for the rolling average
-- - Use OFFSET 6 with a max LIMIT value to skip the first 6 incomplete windows
--     (MySQL does not support OFFSET without LIMIT)

SELECT 
    visited_on,
    SUM(SUM(amount)) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    ROUND(AVG(SUM(amount)) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS average_amount
FROM Customer
GROUP BY visited_on
ORDER BY visited_on
LIMIT 18446744073709551615
OFFSET 6;
