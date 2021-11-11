DROP VIEW CountryRatio;
CREATE VIEW CountryRatio AS
SELECT cc.code, cc.Population, SUM(c.population), SUM(c.population) / CAST(cc.population as DECIMAL) ratio
FROM countries cc
INNER JOIN cities c ON c.countrycode = cc.code
GROUP BY cc.code;


SELECT *
FROM CountryRatio as cr
WHERE cr.sum > 1000000
ORDER BY ratio DESC
LIMIT 1;

-- Answer: NPL