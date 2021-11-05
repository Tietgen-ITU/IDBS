CREATE VIEW CityRatio AS
    SELECT c.countrycode, MAX(c.population), MIN(c.population), (CAST(MAX(c.population) as DECIMAL) / CAST(MIN(c.population) as DECIMAL)) as ratio
    FROM cities c
    GROUP BY c.countrycode;


SELECT c.id
FROM (
    SELECT countrycode, max
    FROM cityRatio
    ORDER BY ratio DESC
    LIMIT 1
) cr
INNER JOIN cities c ON c.countrycode = cr.countrycode
WHERE cr.max = c.population;


-- Answer: 456