-- Problem ID: 1280
-- Title: Students and Examinations
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find the number of times each student attended each exam.
-- Every student should appear with every subject, even if they never attended.
--
-- Table Description:
-- Students
-- | student_id | student_name |
--
-- Subjects
-- | subject_name |
--
-- Examinations
-- | student_id | subject_name |
--
-- Task Requirements:
-- - Show each student paired with every subject
-- - Count how many times each student attended each exam
-- - If a student never attended, show 0 instead of NULL
-- - Return result ordered by student_id and subject_name
--
-- Approach:
-- - CROSS JOIN Students and Subjects to generate all possible student-subject combinations
-- - This ensures every student appears with every subject even with 0 attendances
-- - LEFT JOIN Examinations on both student_id and subject_name to match attendance records
-- - COUNT(e.subject_name) counts only matched rows, returning 0 for unmatched pairs
-- - GROUP BY student_id, student_name, subject_name to aggregate counts per combination
-- - ORDER BY student_id, subject_name as required

SELECT s1.student_id, s1.student_name, s2.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students s1
CROSS JOIN Subjects s2
LEFT JOIN Examinations e
ON s1.student_id = e.student_id AND s2.subject_name = e.subject_name
GROUP BY s1.student_id, s1.student_name, s2.subject_name
ORDER BY s1.student_id, s2.subject_name;
