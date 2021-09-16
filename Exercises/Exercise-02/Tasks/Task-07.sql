SELECT P.id, P.name, 
        MAX(R.result) AS best, 
        MIN(R.result) as worst, 
        to_char(S.record - MAX(R.result), '0D99') as difference
FROM people AS P
INNER JOIN results AS R ON P.id = R.peopleid
INNER JOIN sports AS S on S.id = R.sportid
WHERE S.name = 'Triple Jump'
GROUP BY P.id, S.record
HAVING COUNT(*) >= 20