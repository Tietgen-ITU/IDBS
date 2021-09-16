SELECT COUNT(DISTINCT P.id)
FROM results R
INNER JOIN people P ON P.id = R.peopleid
WHERE R.result IS NULL