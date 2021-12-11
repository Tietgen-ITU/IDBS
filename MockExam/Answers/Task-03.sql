-- Answer 110

SELECT COUNT(*)
FROM (
    SELECT gg.d_id, COUNT(*)
    FROM ggarments gg
    WHERE gg.co_id is null
    GROUP BY gg.d_id
    HAVING COUNT(*) = (SELECT COUNT(*)
                        FROM ggarments ggx
                        WHERE ggx.d_id = gg.d_id )) Result;