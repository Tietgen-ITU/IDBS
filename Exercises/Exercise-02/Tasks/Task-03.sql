SELECT COUNT(*)
FROM (SELECT peopleid
        FROM results
        GROUP BY peopleid
        HAVING COUNT(distinct sportid) >= 1) P;

