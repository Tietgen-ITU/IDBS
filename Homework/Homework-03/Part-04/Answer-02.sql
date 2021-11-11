SELECT COUNT(*)
FROM (
    SELECT c.code, c.name, SUM(cl.percentage)
    FROM countries c
    LEFT JOIN countries_languages cl ON cl.countrycode = c.code
    GROUP BY c.code
    HAVING SUM(cl.percentage) < 100 OR SUM(cl.percentage) IS NULL
) Result



-- Answer: 202