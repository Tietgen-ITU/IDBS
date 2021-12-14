SELECT COUNT(*)
FROM (
    SELECT ge.e_element
    FROM gelements ge
    INNER JOIN gfabrics gf ON gf.f_id = ge.f_id
    WHERE ge.e_element LIKE 'C%'
    GROUP BY ge.e_element
    HAVING COUNT(*) >= 5) Result;

-- Answer 2


-- The answer is correct, however the query has an unecessary inner join
-- It should have looked like this:
select count(*)
from (
	select E.e_Element, count(*)
	from gElements E
	where E.e_Element like 'C%'
	group by E.e_Element
	having count(*) >= 5
) X;