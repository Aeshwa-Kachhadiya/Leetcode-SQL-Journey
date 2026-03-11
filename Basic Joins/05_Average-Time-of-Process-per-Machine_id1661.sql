-- Problem ID: 1661
-- Title: Average Time of Process per Machine
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the average time each machine takes to complete a process,
-- rounded to 3 decimal places.
--
-- Table Description:
-- Activity
-- | machine_id | process_id | activity_type | timestamp |
--
-- Task Requirements:
-- - Calculate time taken for each process (end timestamp - start timestamp)
-- - Find average processing time per machine
-- - Round result to 3 decimal places
-- - Return result in any order
--
-- Approach:
-- - Self JOIN Activity table to pair 'start' and 'end' rows for each process
-- - Join on both machine_id and process_id to match the correct pairs
-- - WHERE clause ensures a1 is always 'start' and a2 is always 'end'
-- - Subtract start timestamp from end timestamp to get process duration
-- - AVG aggregates all process durations per machine
-- - GROUP BY machine_id to get average per machine

SELECT a1.machine_id, ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM Activity a1
JOIN Activity a2
ON a1.machine_id = a2.machine_id
AND a1.process_id = a2.process_id
WHERE a1.activity_type = 'start'
AND a2.activity_type = 'end'
GROUP BY machine_id;
