/*
* The number of persons who have had some role in some movie from all genres from
* the category ‘Newsworthy’ is 156. How many persons have had some role in some
* movie from all genres from the category ‘Lame’?
*/
SELECT COUNT(*)
FROM (SELECT I.personid, COUNT(DISTINCT MG.genre)
        FROM involved I
        INNER JOIN movie_genre MG ON MG.movieid = I.movieid
        WHERE MG.genre IN (SELECT G.genre
                            FROM genre G
                            WHERE G.category = 'Lame')
        GROUP BY I.personid
        HAVING COUNT(DISTINCT MG.genre) = (SELECT COUNT(G.genre)
                                            FROM genre G
                                            WHERE G.category = 'Lame')) Result;


/*Anwers: 1*/


