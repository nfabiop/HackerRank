SELECT D.name, P.name, S.name, A.name
FROM
(
SELECT name, RANK () OVER (ORDER BY name) AS Ranking
FROM OCCUPATIONS
WHERE occupation = 'Doctor'
) D
FULL OUTER JOIN
(
SELECT name, RANK () OVER (ORDER BY name) AS Ranking
FROM OCCUPATIONS
WHERE occupation = 'Professor'
) P
ON P.Ranking = D.Ranking
FULL OUTER JOIN
(
SELECT name, RANK () OVER (ORDER BY name) AS Ranking
FROM OCCUPATIONS
WHERE occupation = 'Singer'
) S
ON S.Ranking = P.Ranking
FULL OUTER JOIN
(
SELECT name, RANK () OVER (ORDER BY name) AS Ranking
FROM OCCUPATIONS
WHERE occupation = 'Actor'
) A
ON A.Ranking = P.Ranking
