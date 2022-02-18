SELECT TRIM(name) + '(' + LEFT(Occupation,1) +')'
FROM OCCUPATIONS
ORDER BY name ASC

SELECT 'There are a total of ' + CAST(T.suma AS varchar(5)) + ' ' + LOWER(T.occupation) + 's.'
FROM
(
SELECT occupation, COUNT(Occupation) AS 'suma'
FROM OCCUPATIONS
GROUP BY occupation
) T
WHERE T.suma > 1
ORDER BY T.suma ASC
;