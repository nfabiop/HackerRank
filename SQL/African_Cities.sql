SELECT CI.name
FROM CITY AS CI
INNER JOIN COUNTRY AS CO
ON CO.code = CI.CountryCode
WHERE 1=1
AND CO.continent = 'Africa'