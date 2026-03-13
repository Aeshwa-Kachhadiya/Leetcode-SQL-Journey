-- Problem ID: 596
-- Title: Classes With at Least 5 Students
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Find all the classes that have at least five students enrolled.
--
-- Table Description:
-- Courses
-- | student | class |
--
-- Note:
-- (student, class) is the primary key of the table.
-- Each row indicates that a student is enrolled in a particular class.
--
-- Task Requirements:
-- - Count the number of students in each class
-- - Return only the classes that have at least 5 students
-- - Result can be returned in any order
--
-- Approach:
-- - Use GROUP BY class to group students by their class
-- - Use COUNT(student) to calculate the number of students per class
-- - Use HAVING to filter groups with at least 5 students

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
