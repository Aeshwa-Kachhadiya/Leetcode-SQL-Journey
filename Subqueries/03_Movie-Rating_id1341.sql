-- Problem ID: 1341
-- Title: Movie Rating
-- Platform: LeetCode
-- Difficulty: Medium
--
-- Problem Statement:
-- 1) Find the user who has rated the greatest number of movies.
--    In case of a tie, return the lexicographically smaller user name.
-- 2) Find the movie with the highest average rating in February 2020.
--    In case of a tie, return the lexicographically smaller movie name.
--
-- Table Description:
-- Movies        : | movie_id | title |
-- Users         : | user_id  | name  |
-- MovieRating   : | movie_id | user_id | rating | created_at |
-- (movie_id, user_id) is the primary key of MovieRating
--
-- Approach:
-- Part 1 (Most active reviewer):
-- - JOIN Users with MovieRating on user_id
-- - GROUP BY user_id and COUNT ratings per user
-- - ORDER BY count DESC, name ASC to handle ties lexicographically
-- - LIMIT 1 to get the top user
--
-- Part 2 (Highest rated movie in Feb 2020):
-- - JOIN Movies with MovieRating on movie_id
-- - Filter February 2020 rows using LIKE '2020-02%' on created_at
-- - GROUP BY movie_id and calculate AVG(rating)
-- - ORDER BY avg rating DESC, title ASC to handle ties lexicographically
-- - LIMIT 1 to get the top movie
--
-- Use UNION ALL to combine both results into a single output column
--
-- SQL Solution:
(SELECT u.name AS results
FROM Users u
JOIN MovieRating m1
    ON u.user_id = m1.user_id
GROUP BY u.user_id
ORDER BY COUNT(m1.user_id) DESC, u.name ASC
LIMIT 1)

UNION ALL

(SELECT m2.title
FROM Movies m2
JOIN MovieRating m1
    ON m2.movie_id = m1.movie_id
WHERE created_at LIKE '2020-02%'
GROUP BY m2.movie_id
ORDER BY AVG(m1.rating) DESC, m2.title ASC
LIMIT 1);
