SELECT COUNT(*)
FROM (
    SELECT c.population as cityPop, cc.population countryPop, ((CAST(c.population as DECIMAL) / CAST(cc.population as DECIMAL)) * 100) as percentage
    FROM cities c
    INNER JOIN countries cc ON cc.code = c.countryCode
) Result
WHERE Result.percentage > 50

-- Answer: 14