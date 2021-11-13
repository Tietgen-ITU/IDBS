SELECT COUNT(*)
FROM (
    SELECT *
    FROM songs
    WHERE duration > '01:00:00' OR duration = '01:00:00'
) result;

-- Answer: 2