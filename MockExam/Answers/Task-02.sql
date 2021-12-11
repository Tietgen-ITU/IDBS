-- TASK 02 A: 250

SELECT COUNT(*)
FROM (
    SELECT gg.d_id
    FROM ggarments gg
    INNER JOIN gmadeof gm ON gm.g_id = gg.g_id
    INNER JOIN gelements ge ON ge.f_id = gm.f_id
    WHERE mo_percentage > 25 AND ge.e_element = 'Procrastinium'
    GROUP BY gg.d_id
) Result;