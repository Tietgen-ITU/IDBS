SELECT COUNT(*)
FROM (SELECT M.title
    FROM movie M
    INNER JOIN involved I ON I.movieid = M.id
    INNER JOIN person P ON P.id = I.personid
    GROUP BY M.id
    HAVING AVG(P.height) > 190) AS AvgHeightMovies