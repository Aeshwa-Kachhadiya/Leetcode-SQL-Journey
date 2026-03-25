-- Problem ID: 1174
-- Title: Immediate Food Delivery II
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Find the percentage of immediate orders among the first orders of all customers,
-- rounded to 2 decimal places.
--
-- Table Description:
-- Delivery
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date |
-- An order is "immediate" if order_date = customer_pref_delivery_date
-- An order is "scheduled" if order_date < customer_pref_delivery_date
-- The first order of a customer is the one with the earliest order_date
--
-- Approach:
-- - For each customer, find their first order using MIN(order_date)
-- - Check if that first order is immediate: MIN(order_date) = MIN(customer_pref_delivery_date)
-- - Use a subquery to count customers whose first order is immediate
-- - Divide by total distinct customers and multiply by 100 for percentage
-- - Use ROUND(..., 2) to round to 2 decimal places
--
-- SQL Solution:
SELECT
    ROUND((SELECT COUNT(*) FROM (
        SELECT customer_id
        FROM Delivery
        GROUP BY customer_id
        HAVING MIN(order_date) = MIN(customer_pref_delivery_date)
    ) AS t) /
    COUNT(DISTINCT customer_id) * 100, 2) AS immediate_percentage
FROM Delivery;
