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


-- The correct answer is 100
-- Here is how the solution should have been
select count(*)
from gDesigners D
where not exists (
    select *
    from gGarments G
    where G.d_ID = D.d_ID
      and G.co_ID is not null)
and not exists (
    select *
    from gGarments G
    where G.co_ID = D.d_ID);