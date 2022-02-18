SELECT COUNT(*)
FROM (
SELECT id,name, population
FROM city
WHERE population > 100000
) T