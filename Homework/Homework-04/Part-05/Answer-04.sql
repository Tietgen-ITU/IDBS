/*
    Question:
    The database contains 12 albums by the artist Queen. 
    How many albums by the artist Tom Waits are in the database?
*/

SELECT COUNT(*)
FROM (
    SELECT *
    FROM artists a
    INNER JOIN albumartists aa ON a.artistid = aa.artistid
    WHERE a.artist = 'Tom Waits'
) res;

-- Answer: 24