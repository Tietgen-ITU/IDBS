/*
    (c) In the countries of North America that have more than 1 million 
    inhabitants, there are a total of 164,688,674 people
    that speak Spanish, according to the statistics in the database. 
    What is the corresponding number for South America?
*/


SELECT SUM(R.languagepercentage)
FROM(
SELECT ((C.population * L.percentage)/100) languagepercentage
FROM countries_continents CC
INNER JOIN countries C ON C.code = CC.countrycode
INNER JOIN countries_languages L ON L.countrycode = C.code
WHERE CC.continent = 'South America' and C.population > 1000000 and L.language = 'Spanish') R;

-- Answer: 160575157