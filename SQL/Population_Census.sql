SELECT SUM(CI.population)
FROM CITY AS CI
INNER JOIN COUNTRY  AS CO
ON CO.Code = CI.CountryCode 
WHERE 1=1
AND CO.continent = 'Asia'