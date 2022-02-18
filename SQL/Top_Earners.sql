SELECT T.earnings, count(T.name)  
FROM 
(
SELECT name, months * salary AS "earnings"
FROM EMPLOYEE
) T
WHERE 1=1
AND T.earnings = (SELECT MAX(months * salary) FROM EMPLOYEE)
GROUP BY T.earnings
