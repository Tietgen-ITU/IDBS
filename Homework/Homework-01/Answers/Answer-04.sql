SELECT COUNT(DISTINCT P.id)
FROM person P
INNER JOIN involved I ON P.id = I.personid
WHERE I.role = 'actor' AND I.movieid IN (SELECT I.movieid
                                        FROM person P
                                        INNER JOIN involved I ON P.id = I.personid
                                        WHERE P.name = 'Steven Spielberg' AND I.role = 'director');

/*Answer 2219*/