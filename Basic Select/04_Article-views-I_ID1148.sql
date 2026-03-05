-- Problem ID: 1148
-- Title: Article Views I
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find all authors who viewed at least one of their own articles.
--
-- Table Description:
-- Views
-- | article_id | author_id | viewer_id | view_date |
--
-- Task Requirements:
-- - Identify authors who have viewed their own articles
-- - Return the author_id as id
-- - Each author should appear only once (distinct)
-- - Sort the result in ascending order by id
--
-- Approach:
-- - Use a WHERE clause to compare author_id with viewer_id
-- - Use DISTINCT to avoid duplicate authors
-- - Use ORDER BY to sort the result ascendingly
--
-- SQL Solution:

SELECT DISTINCT author_id AS id
FROM Views
WHERE viewer_id = author_id
ORDER BY author_id ASC;
