SELECT S.name
FROM
(
SELECT T1.id, T1.salary as "salary_student", T1.friend_id, P2.salary as "salary_friend"
FROM
    (
     SELECT F.id, P1.salary, F.friend_id
     FROM FRIENDS as F
     LEFT JOIN PACKAGES as P1
     ON P1.id = F.id
    ) as T1
    LEFT JOIN PACKAGES as P2
    ON P2.id = T1.friend_id
) as T2
LEFT JOIN STUDENTS as S
ON S.id = T2.id
WHERE T2.salary_student < T2.salary_friend
ORDER BY T2.salary_friend ASC
