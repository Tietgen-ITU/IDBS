/*
* Of all the movies produced in 2002, there are 282 that have entries registered in
* involved for all roles defined in the roles relation. How many movies produced in
* 1999 have entries registered in involved for all roles defined in the roles relation?
* Note: This is a relational division query which must work for any schema; you can not
* use the fact that currently there are only 2 different roles to write a ‘magic number’
*/

SELECT COUNT(*)
FROM (SELECT I.movieid
        FROM involved I 
        INNER JOIN movie M ON M.id = I.movieid
        WHERE M.year = '1999'
        GROUP BY I.movieid
        HAVING COUNT(DISTINCT I.role) = (SELECT COUNT(*) 
                                        FROM role)) Result

/*Answer: 250*/