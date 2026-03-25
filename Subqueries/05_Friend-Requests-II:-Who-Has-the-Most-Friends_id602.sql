-- Problem ID: 602
-- Title: Friend Requests II: Who Has the Most Friends
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Find the person who has the most friends and the count of their friends.
-- A friendship is formed when a request is accepted, and both the requester
-- and accepter gain a friend. It is guaranteed only one person has the most friends.
--
-- Table Description:
-- RequestAccepted
-- | requester_id | accepter_id | accept_date |
-- (requester_id, accepter_id) is the primary key
-- Each row represents an accepted friend request between two users
--
-- Approach:
-- - A person gains a friend whether they are the requester OR the accepter
-- - So count appearances of each person in BOTH columns separately:
--     * COUNT requester_id grouped by requester_id
--     * COUNT accepter_id grouped by accepter_id
-- - Use UNION ALL to combine both counts into a single column
-- - Wrap in an outer query and SUM the counts GROUP BY id
--   to get total friends per person
-- - ORDER BY num DESC and LIMIT 1 to get the person with the most friends
--
-- SQL Solution:
SELECT id, SUM(num) AS num
FROM (
    SELECT requester_id AS id, COUNT(requester_id) AS num
    FROM RequestAccepted
    GROUP BY requester_id

    UNION ALL

    SELECT accepter_id AS id, COUNT(accepter_id) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
) AS combined
GROUP BY id
ORDER BY num DESC
LIMIT 1;
