SELECT FLOOR(AVG(T.Salary) - AVG(T.miscalculated))+1
FROM
(
SELECT 
Salary AS "Salary",
CAST(REPLACE(CAST(Salary AS VARCHAR(4)),'0','') AS INT) AS "miscalculated"
FROM EMPLOYEES
) T
   