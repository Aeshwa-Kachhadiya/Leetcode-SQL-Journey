-- Problem ID: 626
-- Title: Exchange Seats
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- Write a solution to swap the seat id of every two consecutive students.
-- If the number of students is odd, the id of the last student is not swapped.
-- Return the result table ordered by id in ascending order.
--
-- Table Description:
-- Seat
-- | id      | int     | Primary Key |
-- | student | varchar |             |
--
-- Note:
-- - id is the primary key and always starts from 1, incrementing continuously.
-- - If total number of students is odd, the last student keeps their original id.
--
-- Task Requirements:
-- - Swap seat ids of every two consecutive students (1↔2, 3↔4, 5↔6 ...)
-- - If total count is odd, the last student's id remains unchanged
-- - Return result ordered by id in ascending order
--
-- Approach:
-- - Use CASE WHEN with MOD(id, 2) to identify even and odd ids
-- - Even id → assign id-1 (move one step back)
-- - Odd id that is the last row → keep id as-is (edge case for odd total count)
-- - Any other odd id → assign id+1 (move one step forward)
-- - Use (SELECT COUNT(id) FROM Seat) to detect the last row
-- - Alias the computed CASE result as id so ORDER BY sorts by the new swapped id

SELECT 
CASE
    WHEN MOD(id,2)=0 THEN id-1
    WHEN id=(SELECT COUNT(id) FROM Seat) THEN id
    ELSE id+1
END AS id, student
FROM Seat
ORDER BY id ASC;
