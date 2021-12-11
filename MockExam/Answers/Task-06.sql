SELECT COUNT(*)
FROM (
    SELECT g_id, SUM(mo_percentage)
    FROM gmadeof
    GROUP BY g_id
    HAVING SUM(mo_percentage) <> 100) Result;