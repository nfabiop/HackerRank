SELECT T.start_date, T.end_date
FROM
(
    SELECT S.start_date, E.end_date,  DATEDIFF(day, S.start_date, E.end_date) as "days_to_completion"
    FROM
        (
        SELECT DISTINCT start_date, RANK() OVER(ORDER BY start_date ASC) as "indice"
        FROM PROJECTS
        WHERE 1=1
        AND start_date NOT IN (SELECT DISTINCT end_date FROM PROJECTS)
        ) S
    LEFT JOIN 
        (
        SELECT DISTINCT end_date, RANK() OVER(ORDER BY end_date ASC) as "indice"
        FROM PROJECTS
        WHERE 1=1
        AND end_date NOT IN (SELECT DISTINCT start_date FROM PROJECTS)
    ) E
    ON E.indice = S.indice
) T
ORDER BY T.days_to_completion ASC, T.start_date ASC