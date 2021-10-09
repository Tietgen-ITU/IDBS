/*
    (a) The empire `Great Britain' consists of 4 countries. 
    How many countries does the empire `Danish Empire' consist of?
*/

SELECT COUNT(*)
FROM (SELECT E.countryCode, E.empire
FROM empires E
WHERE E.empire = 'Danish Empire') R;


-- Answer 3