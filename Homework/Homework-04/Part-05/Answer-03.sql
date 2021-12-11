/*
The database contains just 5 songs released in 1953. 
What is the largest number of songs released in a single year?

Note: This is a very simple query. 
Try answering instead which year had the largest number of songs. 
Observe how much harder this query is!
*/


-- This is the easy version to get the max number of songs release in a year
SELECT MAX(res.count)
FROM (
    SELECT extract(year from releasedate), COUNT(*)
    FROM songs s
    GROUP BY extract(year from releasedate)
) res;

-- Answer: 833

-- This is the query where we get the year with the most number of songs released

SELECT EXTRACT(year from releasedate) releaseyear
FROM songs s
GROUP BY extract(year from releasedate)
HAVING COUNT(*) = (SELECT MAX(res.count)
                    FROM (
                        SELECT COUNT(*)
                        FROM songs s
                        GROUP BY extract(year from releasedate)
                    ) res);

-- Answer: 2009