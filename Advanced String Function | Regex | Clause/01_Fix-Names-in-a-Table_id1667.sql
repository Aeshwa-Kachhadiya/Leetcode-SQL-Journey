-- Problem ID: 1667
-- Title: Fix Names in a Table
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Write a query to format the 'name' column such that:
-- - The first character is uppercase
-- - The remaining characters are lowercase
--
-- Table Description:
-- Users
-- | user_id | name |
--
-- Note:
-- - user_id is the primary key
-- - name contains only uppercase and lowercase English letters
--
-- Task Requirements:
-- - Convert each name so that:
--     * First letter → uppercase
--     * Remaining letters → lowercase
-- - Return results ordered by user_id
--
-- Approach:
-- - Use UPPER() to capitalize the first character
-- - Use LOWER() to convert the remaining substring
-- - Use SUBSTRING() to split the name:
--     * First character → SUBSTRING(name, 1, 1)
--     * Remaining → SUBSTRING(name, 2)
-- - Concatenate both parts using CONCAT()
-- - Order the result by user_id

SELECT 
    user_id,
    CONCAT(
        UPPER(SUBSTRING(name, 1, 1)),
        LOWER(SUBSTRING(name, 2))
    ) AS name
FROM Users
ORDER BY user_id;
