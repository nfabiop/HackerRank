SELECT W.hacker_id, W.name, W.chall_int
FROM
(
    SELECT A.hacker_id, A.name,B.chall_str, B.num_hackers, A.chall_int
    FROM
    (
        SELECT H.hacker_id, H.name, COUNT(C.challenge_id) as "chall_int"
        FROM HACKERS as H
        LEFT JOIN CHALLENGES as C
        ON C.hacker_id = H.hacker_id
        GROUP BY H.hacker_id, H.name
    ) as A

    LEFT JOIN 

    (
    SELECT
    CAST(T.num_challenges AS VARCHAR(10)) as "chall_str",
    T.num_challenges,
    COUNT(T.hacker_id) as "num_hackers"
    FROM
        (
         SELECT H.hacker_id, H.name, COUNT(C.challenge_id) as "num_challenges"
         FROM HACKERS as H
         LEFT JOIN CHALLENGES as C
         ON C.hacker_id = H.hacker_id
         GROUP BY H.hacker_id, H.name
        ) as T
    GROUP BY CAST(T.num_challenges AS VARCHAR(10)),T.num_challenges
    ) B

    ON B.num_challenges = A.chall_int 
) W
WHERE 
W.num_hackers = 1 OR
(
    W.num_hackers > 1 AND 
    W.chall_int = 
    (
        SELECT MAX(num_challenges)
        FROM
            (
             SELECT H.hacker_id, H.name, COUNT(C.challenge_id) as "num_challenges"
             FROM HACKERS as H
             LEFT JOIN CHALLENGES as C
             ON C.hacker_id = H.hacker_id
             GROUP BY H.hacker_id, H.name
            ) as T2
    )
)
ORDER BY W.chall_int DESC, W.hacker_id ASC