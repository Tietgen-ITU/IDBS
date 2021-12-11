SELECT COUNT(*)
FROM (
    SELECT ge.e_element
    FROM gelements ge
    INNER JOIN gfabrics gf ON gf.f_id = ge.f_id
    WHERE ge.e_element LIKE 'C%'
    GROUP BY ge.e_element
    HAVING COUNT(*) >= 5) Result;

    -- Answer 2