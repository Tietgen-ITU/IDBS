SELECT P.id, P.name, COUNT(S.name)
FROM sports S
INNER JOIN results R ON R.sportid = S.id
INNER JOIN people P ON P.id = R.peopleid
WHERE R.result >= S.record
GROUP BY P.id
HAVING COUNT(DISTINCT S.name) >= 2;