-- Problem ID: 1327
-- Title: List the Products Ordered in a Period
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the names of products that have at least 100 units ordered
-- in February 2020 and their total ordered amount.
--
-- Table Description:
-- Products
-- | product_id | product_name | product_category |
--
-- Orders
-- | product_id | order_date | unit |
--
-- Note:
-- - product_id is primary key in Products table
-- - Orders table may have duplicate rows
-- - product_id in Orders is a foreign key to Products
-- - unit is the number of products ordered on order_date
--
-- Task Requirements:
-- - Filter orders only from February 2020
-- - Sum total units ordered per product
-- - Return only products with total units >= 100
-- - Return product_name and total unit amount
--
-- Approach:
-- - LEFT JOIN Products with Orders on product_id
-- - Filter February 2020 dates using LIKE in WHERE clause
-- - GROUP BY product to sum units per product
-- - Use HAVING to filter groups with total units >= 100
--
-- Logic:
-- - WHERE filters rows BEFORE grouping (date filter goes here)
-- - SUM(unit) calculates total units per product after grouping
-- - HAVING filters groups AFTER grouping (SUM condition goes here)
-- - Cannot use SUM() in WHERE — that's why HAVING is used
--
-- SQL Solution:
SELECT p.product_name, SUM(o.unit) AS unit
FROM Products p
LEFT JOIN Orders o
ON p.product_id = o.product_id
WHERE o.order_date LIKE '2020-02%'
GROUP BY o.product_id
HAVING SUM(o.unit) >= 100;
