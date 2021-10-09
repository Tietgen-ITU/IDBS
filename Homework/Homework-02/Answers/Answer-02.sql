/*
(b) There are 4 countries that are present on more than one continent. 
How many of these countries are partially in Europe?
*/

SELECT COUNT(*)
FROM(SELECT DISTINCT CC.countryCode
FROM countries_continents CC
WHERE CC.percentage <> 100 AND CC.continent = 'Europe') R;

-- Answer 2