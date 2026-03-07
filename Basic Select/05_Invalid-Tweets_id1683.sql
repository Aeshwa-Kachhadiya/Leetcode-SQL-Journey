-- Problem ID: 1683
-- Title: Invalid Tweets
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the IDs of the invalid tweets.
-- A tweet is invalid if the number of characters in the content is strictly greater than 15.
--
-- Table Description:
-- Tweets
-- | tweet_id | content |
--
-- Task Requirements:
-- - Identify tweets where the content length exceeds 15 characters
-- - Return the tweet_id of invalid tweets
-- - Return the result in any order
--
-- Approach:
-- - Use a WHERE clause with LENGTH() function to filter content longer than 15 characters
--
-- SQL Solution:
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
