DROP VIEW IF EXISTS ColabDesigner;

CREATE VIEW ColabDesigner AS
SELECT gd.d_id, gd.d_country, gg.d_id AS CoDesinger
FROM gdesigners gd
INNER JOIN ggarments gg ON gd.d_id = gg.co_id
UNION
SELECT gd.d_id, gd.d_country, gg.co_id AS CoDesinger
FROM gdesigners gd
INNER JOIN ggarments gg ON gd.d_id = gg.d_id
WHERE gg.co_id IS NOT NULL;

SELECT gd.d_id
FROM gdesigners gd
INNER JOIN ColabDesigner cd ON cd.codesinger = gd.d_id
GROUP BY gd.d_id
ORDER BY COUNT(DISTINCT cd.d_country) desc
LIMIT 1;



