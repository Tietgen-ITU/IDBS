SELECT COUNT(*)
FROM (SELECT DISTINCT movieid
    FROM movie_genre
    GROUP BY movieid, genre
    HAVING COUNT(*) > 1) M

/*Answer: 143*/