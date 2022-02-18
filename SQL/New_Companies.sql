SELECT 
C.company_code, 
C.founder, 
COUNT(DISTINCT E.lead_manager_code) AS "Sum_LM", 
COUNT(DISTINCT E.senior_manager_code) AS "Sum_SM",
COUNT(DISTINCT E.manager_code) AS "Sum_M",
COUNT(DISTINCT E.employee_code) AS "Sum_E"
FROM
(
SELECT company_code, founder
FROM COMPANY
) C
LEFT JOIN 
(
SELECT  employee_code, manager_code, senior_manager_code, lead_manager_code, company_code
FROM Employee
) E
ON E.company_code = C.company_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code ASC
