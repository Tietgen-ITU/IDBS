/*
* In the database, the number of persons who have acted in exactly one movie that
* they self directed is 603. How many persons have acted in more than one movie that
* they self directed?
*/

SELECT COUNT(*)
FROM (SELECT SP.personid
        FROM (SELECT I.personid, I.movieid
                FROM involved I
                WHERE I.role IN ('actor', 'director')
                GROUP BY I.personid, I.movieid
                HAVING COUNT(*) > 1) SP
        GROUP BY SP.personid
        HAVING COUNT(*) > 1) R

/*Answer: 345*/