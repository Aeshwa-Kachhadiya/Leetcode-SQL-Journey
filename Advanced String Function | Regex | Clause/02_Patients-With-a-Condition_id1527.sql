-- Problem ID: 1527
-- Title: Patients With a Condition
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Write a query to find patients who have Type I Diabetes.
-- A condition is considered Type I Diabetes if it starts with the prefix 'DIAB1'.
--
-- Table Description:
-- Patients
-- | patient_id | patient_name | conditions |
--
-- Note:
-- - patient_id is the primary key
-- - conditions contains 0 or more condition codes separated by spaces
--
-- Task Requirements:
-- - Find patients whose 'conditions' include a code starting with 'DIAB1'
-- - The code can:
--     * Appear at the beginning OR
--     * Appear after a space
-- - Return:
--     * patient_id
--     * patient_name
--     * conditions
-- - Result can be in any order
--
-- Approach:
-- - Use REGEXP to match the pattern 'DIAB1'
-- - Ensure it matches:
--     * At the start of the string → '^DIAB1'
--     * OR after a space → ' DIAB1'
-- - Combine both using OR (|) in REGEXP
--
-- Pattern used:
--     '^DIAB1| DIAB1'
--
-- Explanation:
-- - '^DIAB1' → matches if condition starts with DIAB1
-- - ' DIAB1' → matches if DIAB1 appears after a space
--
-- SQL Solution:

SELECT 
    patient_id,
    patient_name,
    conditions
FROM Patients
WHERE conditions REGEXP '^DIAB1| DIAB1';
