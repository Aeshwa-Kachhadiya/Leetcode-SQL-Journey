-- Problem ID: 2356
-- Title: Number of Unique Subjects Taught by Each Teacher
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Calculate the number of unique subjects each teacher teaches
-- in the university.
--
-- Table Description:
-- Teacher
-- | teacher_id | subject_id | dept_id |
--
-- Note:
-- (subject_id, dept_id) is the primary key of the table.
-- Each row indicates that a teacher teaches a specific subject
-- in a particular department.
--
-- Task Requirements:
-- - Count the number of unique subjects taught by each teacher
-- - Each teacher should appear once in the result
-- - Return the result in any order
--
-- Approach:
-- - Use GROUP BY teacher_id to aggregate records per teacher
-- - Use COUNT(DISTINCT subject_id) to count only unique subjects
-- - DISTINCT ensures the same subject taught in different departments
--   is counted only once per teacher

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id
ORDER BY teacher_id ASC;
