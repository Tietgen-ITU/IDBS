DROP VIEW IF EXISTS ColabDesigner;

CREATE VIEW ColabDesigner AS
SELECT gd.d_id, gd.d_country, gg.d_id AS CoDesinger
FROM gdesigners gd
INNER JOIN ggarments gg ON gd.d_id = gg.co_id
UNION
SELECT gd.d_id, gd.d_country, gg.co_id AS CoDesinger
FROM gdesigners gd
INNER JOIN ggarments gg ON gd.d_id = gg.d_id
WHERE gg.co_id IS NOT NULL;

SELECT gd.d_id
FROM gdesigners gd
INNER JOIN ColabDesigner cd ON cd.codesinger = gd.d_id
GROUP BY gd.d_id
ORDER BY COUNT(DISTINCT cd.d_country) desc
LIMIT 1;

-- Answer 582

/*
* Here the answer is correct but you should instead have tried to avoid using
* the LIMIT 1... like this one:
*/

-- A view just like the above
drop view if exists gAllPairs;
create view gAllPairs
as
select G.d_ID as d_ID1, G.co_ID as d_ID2
from gGarments G
where not G.co_ID is null
union
select G.co_ID as d_ID1, G.d_ID as d_ID2
from gGarments G
where not G.co_ID is null;

-- Another view that counts the contries
drop view if exists gCountryCount;
create view gCountryCount
as
select P.d_ID1 as d_ID, 
	count(*) as d_DesignerCount, 
	count(distinct D.d_Country) as d_CountryCount
from gAllPairs P
	join gDesigners D on P.d_ID2 = D.d_ID
group by P.d_ID1;

-- 7 countries, 13 designers
select * 
from gCountryCount CC
where CC.d_ID = 100;

-- 582
select d_ID
from gCountryCount CC
where CC.d_CountryCount = (
	select max(d_CountryCount) 
	from gCountryCount
);


