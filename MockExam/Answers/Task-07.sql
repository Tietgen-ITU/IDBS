SELECT COUNT(*)
FROM (
    SELECT d_id
    FROM gtypes gt
    INNER JOIN ghastype gh ON gh.t_id = gt.t_id
    INNER JOIN ggarments gg ON gh.g_id = gg.g_id
    WHERE gt.t_category = 'Dress'
    GROUP BY d_id
    HAVING COUNT(DISTINCT gt.t_name) = (SELECT COUNT(*)
                                        FROM gtypes gt
                                        WHERE gt.t_category = 'Dress')) Result;

-- Answer: 6