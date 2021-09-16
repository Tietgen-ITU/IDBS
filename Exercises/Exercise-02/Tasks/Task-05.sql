SELECT DISTINCT P.id, P.name, G.description
FROM results as R
INNER JOIN people AS P ON P.id = R.peopleid
INNER JOIN gender AS G ON P.gender = G.gender
INNER JOIN sports as S ON S.id = R.sportid
WHERE R.result = S.record