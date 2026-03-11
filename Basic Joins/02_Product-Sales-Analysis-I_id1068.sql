-- Problem ID: 1068
-- Title: Product Sales Analysis I
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Report the product_name, year, and price for each sale_id in the Sales table.
--
-- Table Description:
-- Sales
-- | sale_id | product_id | year | quantity | price |
--
-- Product
-- | product_id | product_name |
--
-- Task Requirements:
-- - Show product_name, year, and price for each sale
-- - product_id in Sales is a foreign key referencing Product table
-- - Return the result in any order
--
-- Approach:
-- - Use LEFT JOIN to fetch product_name from Product table
-- - Join on matching product_id between Sales and Product
-- - LEFT JOIN ensures all sales records are retained even if product info is missing

SELECT p.product_name, s.year, s.price
FROM Sales AS s
LEFT JOIN Product AS p
ON s.product_id = p.product_id;
