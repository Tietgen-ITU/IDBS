SELECT P.ID, P.name
FROM people as P
INNER JOIN results as R ON R.peopleid = P.ID
GROUP BY P.ID
HAVING COUNT(*) >= 20