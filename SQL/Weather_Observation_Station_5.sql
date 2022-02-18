WITH T (city) AS
(
SELECT DISTINCT CITY
FROM station
)
SELECT TOP 1 city, LEN(city)
FROM T
WHERE LEN(city) = (SELECT MAX(tam) from (select LEN(city) as tam from T) A)
UNION
SELECT TOP 1 city, LEN(city)
FROM T
WHERE LEN(city) = (SELECT MIN(tam) from (select LEN(city) as tam from T) B);