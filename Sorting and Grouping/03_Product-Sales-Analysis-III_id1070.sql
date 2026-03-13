-- Problem ID: 1070
-- Title: Product Sales Analysis III
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Find all sales that occurred in the first year each product was sold.
-- For each product_id, identify the earliest year it appears in the Sales table
-- and return all sales entries for that product in that year.
--
-- Table Description:
-- Sales
-- | sale_id | product_id | year | quantity | price |
--
-- Note:
-- (sale_id, year) is the primary key of the table.
-- A product may have multiple sales entries in the same year.
--
-- Task Requirements:
-- - Determine the first year each product was sold
-- - Return all sales records that occurred in that first year
-- - Output columns: product_id, first_year, quantity, price
-- - Result can be returned in any order
--
-- Approach:
-- - Use a subquery to find the earliest year (MIN(year)) for each product
-- - GROUP BY product_id to calculate the first year per product
-- - Join the original Sales table with the subquery
-- - Match both product_id and year to retrieve the sales records
--   that occurred in the first year

SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) t
ON s.product_id = t.product_id
AND s.year = t.first_year;
