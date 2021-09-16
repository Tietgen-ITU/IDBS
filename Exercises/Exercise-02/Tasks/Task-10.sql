SELECT P.name, 
        S.name, 
        (CASE 
            WHEN R.result IS NOT NULL THEN to_char((R.result * 100) / S.record, '999%')
            ELSE to_char(0, '9%')
        END) AS percentage
FROM Results R
INNER JOIN sports S ON S.id = R.sportid
INNER JOIN people P ON P.id = R.peopleid;