-- Problem ID: 1204
-- Title: Last Person to Fit in the Bus
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Find the name of the last person who can board the bus without
-- exceeding the total weight limit of 1000 kg.
--
-- Table Description:
-- Queue
-- | person_id | person_name | weight | turn |
--
-- Note:
-- person_id is unique.
-- turn represents the order in which people board the bus.
-- turn = 1 → first person to board
-- turn = n → last person in the queue.
--
-- Task Requirements:
-- - People board the bus in order of the "turn" column
-- - The total weight on the bus cannot exceed 1000 kg
-- - Find the last person who can board before the limit is exceeded
--
-- Approach:
-- - Use SUM() as a window function to calculate the running total weight
-- - SUM(weight) OVER(ORDER BY turn) adds weights sequentially based on boarding order
-- - This simulates people boarding the bus one by one
-- - Inner Query builds a view with cumulative weight for each boarding step:
--
--     turn | person_name | weight | total_weight
--     -----+-------------+--------+-------------
--       1  | Alice       | 250    | 250
--       2  | Alex        | 350    | 600
--       3  | John Cena   | 400    | 1000  ← still allowed
--       4  | Marie       | 200    | 1200  ← exceeds limit
--
-- - Outer Query filters rows where total_weight <= 1000
-- - The last valid person will have the highest cumulative weight
-- - ORDER BY Total_Weight DESC ensures the last valid passenger is selected
-- - LIMIT 1 returns that single person
--
-- Window Function Used:
--   SUM(weight) OVER(ORDER BY turn)
--   ├── SUM()        → calculates cumulative weight
--   ├── OVER()       → defines window operation
--   └── ORDER BY     → ensures weights are added in boarding order

SELECT person_name
FROM (
    SELECT
        person_id,
        person_name,
        weight,
        turn,
        SUM(weight) OVER(ORDER BY turn) AS Total_Weight
    FROM Queue
) t
WHERE Total_Weight <= 1000
ORDER BY Total_Weight DESC
LIMIT 1;
