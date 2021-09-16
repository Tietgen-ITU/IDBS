SELECT DISTINCT P.id, P.name, G.description
FROM competitions C
INNER JOIN results R ON R.competitionid = C.id
INNER JOIN people P ON R.peopleid = P.id
INNER JOIN gender G ON G.gender = P.gender
WHERE C.place = 'Hvide Sande' AND extract(year from C.held) = '2009'