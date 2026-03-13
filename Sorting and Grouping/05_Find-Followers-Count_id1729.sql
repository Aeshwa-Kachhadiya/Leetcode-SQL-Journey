-- Problem ID: 1729
-- Title: Find Followers Count
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- For each user, find the total number of followers they have
-- in the social media application.
--
-- Table Description:
-- Followers
-- | user_id | follower_id |
--
-- Note:
-- (user_id, follower_id) is the primary key of the table.
-- Each row indicates that follower_id follows user_id.
--
-- Task Requirements:
-- - Count the number of followers for each user
-- - Return the user_id and the number of followers
-- - Order the result by user_id in ascending order
--
-- Approach:
-- - Use GROUP BY user_id to group all followers of each user
-- - Use COUNT(follower_id) to count the number of followers
-- - Use ORDER BY user_id to sort the result in ascending order

SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
