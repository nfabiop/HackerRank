SELECT T.primera_posicion, T.segunda_posicion
FROM
    (
    SELECT T1.primera_posicion, T1.segunda_posicion
    FROM
        (
        SELECT
        CASE WHEN x1 < y1 THEN x1
             ELSE y1 
        END as "primera_posicion",
        CASE WHEN x1 > y1 THEN x1
             ELSE y1 
        END as "segunda_posicion"
        FROM
            (
            SELECT DISTINCT x as "x1", y as "y1"
            FROM FUNCTIONS
            ) F1
            INNER JOIN 
            (
            SELECT DISTINCT y as "x2", x as "y2"
            FROM FUNCTIONS
            ) F2
            ON (F2.x2 = F1.x1 AND F2.y2 = F1.y1)
        WHERE F1.x1 <> F1.y1
        GROUP BY 
        CASE WHEN x1 < y1 THEN x1
             ELSE y1 
        END,
        CASE WHEN x1 > y1 THEN x1
             ELSE y1 
        END
        ) T1
    UNION 
        SELECT T2.x as "primera_posicion",T2.y as "segunda_posicion"
        FROM
            (
            SELECT x, y, COUNT(*) as "cantidad"
            FROM FUNCTIONS
            GROUP BY x,y
            ) T2
        WHERE T2.cantidad > 1
    ) T
ORDER BY T.primera_posicion ASC