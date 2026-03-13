-- Problem ID: 1045
-- Title: Customers Who Bought All Products
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Report the customer_ids from the Customer table who have bought
-- all the products listed in the Product table.
--
-- Table Description:
-- Customer
-- | customer_id | product_key |
--
-- Product
-- | product_key |
--
-- Note:
-- - The Customer table may contain duplicate rows.
-- - product_key in Customer is a foreign key referencing Product table.
-- - product_key in Product is the primary key.
--
-- Task Requirements:
-- - Determine which customers purchased every product listed in the Product table
-- - Each qualifying customer_id should appear once in the result
-- - Return the result in any order
--
-- Approach:
-- - Use GROUP BY customer_id to group all purchases made by each customer
-- - Use COUNT(DISTINCT product_key) to count the number of unique products bought
-- - Compare this count with the total number of products in the Product table
-- - If both counts match, the customer bought all products

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(product_key)
    FROM Product
);
