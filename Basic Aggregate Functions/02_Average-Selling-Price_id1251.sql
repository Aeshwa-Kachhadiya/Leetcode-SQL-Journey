-- Problem ID: 1251
-- Title: Average Selling Price
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the average selling price for each product.
-- The average selling price should be rounded to 2 decimal places.
-- If a product does not have any sold units, its average selling price should be 0.
--
-- Table Description:
-- Prices
-- | product_id | start_date | end_date | price |
--
-- UnitsSold
-- | product_id | purchase_date | units |
--
-- Task Requirements:
-- - Match each sale with the correct price period
-- - Calculate total revenue (price * units) for each product
-- - Divide total revenue by total units sold to get the average selling price
-- - If no units are sold for a product, return 0
-- - Round the result to 2 decimal places
--
-- Approach:
-- - Use LEFT JOIN to combine Prices with UnitsSold
-- - Join on product_id and ensure purchase_date falls between start_date and end_date
-- - Calculate total revenue using price * units
-- - Use SUM(price * units) / SUM(units) to compute the average price
-- - Use IFNULL to return 0 when no units are sold
-- - Round the result to 2 decimal places
--
-- SQL Solution:
SELECT 
    p.product_id,
    ROUND(IFNULL(SUM(p.price * u.units) / SUM(u.units), 0), 2) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
