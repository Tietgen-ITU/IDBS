SELECT COUNT(*)
FROM (
    SELECT c.code, c.name, SUM(cl.percentage)
    FROM countries c
    INNER JOIN countries_languages cl ON cl.countrycode = c.code
    GROUP BY c.code
    HAVING SUM(cl.percentage) < 100
) Result

-- Answer: 202