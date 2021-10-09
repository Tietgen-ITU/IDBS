/*
    (d) According to the database, 
    one language is spoken in all the countries of the `Danish Empire'. 
    How many languages are spoken in all the countries of `Benelux'?
*/

SELECT L.language
FROM empires E
INNER JOIN countries_languages L ON L.countrycode = E.countrycode
WHERE E.empire = 'Benelux'
GROUP BY L.language
HAVING COUNT(*) >= (SELECT COUNT(*) 
                    FROM empires
                    WHERE empire = 'Benelux')

-- Answer: 2