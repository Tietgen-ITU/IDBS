SELECT COUNT(*)
FROM (
    SELECT g_id, SUM(mo_percentage)
    FROM gmadeof
    GROUP BY g_id
    HAVING SUM(mo_percentage) <> 100) Result;

-- Answer: 4267

/* 
* This answer is not complete. And the answer is not correct. You forgot to check
* for null. Here there could have been different solutions. One where you both 
* check for not 100 percent and for garments that does not have a fabric in the 
* made of table.
*/

select count(*)
from (
	select G.g_ID
	from gGarments G
	    join gMadeOf MO on G.g_ID = MO.g_ID
	group by G.g_ID
	having sum(MO.mo_Percentage) <> 100
	union
	select G.g_ID
	from gGarments G
	    left join gMadeOf MO on G.g_ID = MO.g_ID
	where MO.g_ID is NULL
) X;


-- Or you could have one where you just check whether if they exist with 100 percent
select count(*)
from ggarments
where g_id not in (	
    select g_id
	from gmadeof
	group by g_id
	having sum(mo_percentage) = 100
);