-- Answer = 1481

SELECT d_id, AVG(g_price)
FROM ggarments
GROUP BY d_id
ORDER BY AVG(g_price) DESC
LIMIT 1;

-- How it should have been done

DROP VIEW IF EXISTS AverageGarmentPrice;
CREATE VIEW AverageGarmentPrice AS
SELECT d_id, AVG(g_price) as avg_price
FROM ggarments
GROUP BY d_id;

SELECT gg.d_id
FROM ggarments gg
GROUP BY gg.d_id
HAVING AVG(gg.g_price) = (SELECT MAX(av.avg_price)
                        FROM AverageGarmentPrice av);