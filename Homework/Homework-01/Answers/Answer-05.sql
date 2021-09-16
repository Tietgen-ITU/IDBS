/*
* Of all the movies produced in 2002, there are 12 that have no registered entry in
* involved. How many movies produced in 1999 have no registered entry in involved?
*/
SELECT COUNT(*)
FROM (SELECT *
    FROM movie M
    WHERE year = '1999' AND M.id NOT IN (SELECT I.movieid
                                        FROM involved I)) R

/*Answer 7*/