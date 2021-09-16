SELECT S.name, COUNT(DISTINCT R.peopleid) AS numathletes
FROM sports AS S, results AS R
WHERE S.record = R.result AND S.id = R.sportid 
GROUP BY S.name
