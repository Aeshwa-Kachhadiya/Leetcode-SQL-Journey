-- Problem ID: 550
-- Title: Game Play Analysis IV
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Find the fraction of players that logged in again on the day immediately
-- after their first login, rounded to 2 decimal places.
--
-- Table Description:
-- Activity
-- | player_id | device_id | event_date | games_played |
-- (player_id, event_date) is the primary key
-- Each row records a player's login and games played on a specific date
--
-- Approach:
-- - Find each player's first login date using MIN(event_date) in a correlated subquery
-- - Self JOIN the Activity table to check if the same player has a login
--   exactly 1 day after their first login using DATEDIFF(a2.event_date, a1.event_date) = 1
-- - COUNT the players who satisfy this condition
-- - Divide by total distinct players from the whole table
-- - Use ROUND(..., 2) to round to 2 decimal places
--
-- SQL Solution:
SELECT ROUND(COUNT(a1.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity a1
JOIN Activity a2
    ON a1.player_id = a2.player_id
    AND DATEDIFF(a2.event_date, a1.event_date) = 1
WHERE a1.event_date = (
    SELECT MIN(event_date)
    FROM Activity
    WHERE player_id = a1.player_id
);
