SELECT P.name, G.description
FROM people P
INNER JOIN gender G ON G.gender = P.gender
WHERE P.name LIKE '% J%sen'