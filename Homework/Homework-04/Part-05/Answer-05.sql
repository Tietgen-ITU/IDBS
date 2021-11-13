/*
    Question:
    The database contains 187 di􏰂erent albums with a genre whose name starts with Ele (for example, some of these have the genre Electronica). 
    How many di􏰂erent albums have a genre whose name starts with Alt?
*/

SELECT g.genre
FROM genres g
INNER JOIN albumgenres ag ON ag.genreid = g.genreid
WHERE g.genre LIKE 'Alt%' AND g.genre NOT LIKE '%&%';

-- Answer: 422