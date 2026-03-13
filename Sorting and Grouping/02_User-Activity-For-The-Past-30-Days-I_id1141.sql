-- Problem ID: 1141
-- Title: User Activity for the Past 30 Days I
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the daily active user count for a period of 30 days
-- ending on 2019-07-27 (inclusive).
-- A user is considered active on a day if they perform
-- at least one activity on that day.
--
-- Table Description:
-- Activity
-- | user_id | session_id | activity_date | activity_type |
--
-- Note:
-- activity_type can be one of the following:
-- ('open_session', 'end_session', 'scroll_down', 'send_message')
-- Any of these activities counts as valid activity.
-- The table may contain duplicate rows.
--
-- Task Requirements:
-- - Consider activities within the 30-day period ending 2019-07-27
-- - Count unique users active on each day
-- - Return the result with the activity date and number of active users
-- - Result can be returned in any order
--
-- Approach:
-- - Use WHERE with BETWEEN to filter activities in the last 30 days
-- - Use GROUP BY activity_date to calculate results per day
-- - Use COUNT(DISTINCT user_id) to count unique active users
-- - Select activity_date as the day column

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;
