-- TASK 01 A: 2853
SELECT COUNT(*)
FROM (
    SELECT g_price
    FROM ggarments
    WHERE g_price is null
) Result;

