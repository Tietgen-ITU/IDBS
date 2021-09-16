SELECT S.id, S.name, MAX(R.result) AS maxres
FROM sports S
INNER JOIN results R ON R.sportid = S.id
INNER JOIN competitions C ON C.id = R.competitionid
GROUP BY S.id