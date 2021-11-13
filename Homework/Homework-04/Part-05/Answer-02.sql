/*
Question:
What is the total duration, in seconds, of all songs in the database?
*/

SELECT extract(epoch from SUM(duration)) seconds
FROM songs

# Answer: 3883371.0