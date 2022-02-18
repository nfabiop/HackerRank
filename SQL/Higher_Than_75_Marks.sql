SELECT T.Name
FROM 
(
SELECT Name, ID, RIGHT(Name,3) as "tres"
FROM students
WHERE 1=1
AND Marks > 75
) T
ORDER BY T.tres ASC, T.ID ASC
;