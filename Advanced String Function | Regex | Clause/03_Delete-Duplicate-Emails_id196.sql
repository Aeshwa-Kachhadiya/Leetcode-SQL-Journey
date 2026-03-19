-- Problem ID: 196
-- Title: Delete Duplicate Emails
-- Platform: LeetCode
-- Difficulty: Easy
--
-- Problem Statement:
-- Write a query to delete duplicate emails, keeping only one unique email.
-- The retained email should be the one with the smallest id.
--
-- Table Description:
-- Person
-- | id | email |
--
-- Note:
-- - id is the primary key
-- - email contains only lowercase letters
-- - Duplicate emails may exist
--
-- Task Requirements:
-- - Remove duplicate email records
-- - Keep only the record with the smallest id for each email
-- - Use a DELETE statement (not SELECT)
-- - Final table order does not matter
--
-- Approach:
-- - Use self JOIN on the Person table
-- - Compare rows with the same email
-- - Keep the row with smaller id
-- - Delete the row with larger id
--
-- Logic:
-- - p1 joins p2 where emails are same
-- - If p1.id > p2.id → p1 is duplicate → delete it
--
-- SQL Solution:

DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
WHERE p1.id > p2.id;
