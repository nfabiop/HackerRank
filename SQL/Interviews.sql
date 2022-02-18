SELECT 
T.contest_id,
T.hacker_id,
T.name,
SUM(T.total_submissions) as "total_submissions",
SUM(T.total_accepted_submissions) as "total_accepted_submissions",
SUM(T.total_views) as "total_views",
SUM(T.total_unique_views) as "total_unique_views"
FROM 
(
SELECT
A1.contest_id,
A1.hacker_id,
A1.name,
0 as "total_submissions",
0 as "total_accepted_submissions",
SUM(T1.total_views) as "total_views",
SUM(T1.total_unique_views) as "total_unique_views"
FROM
(
    SELECT 
    CO.contest_id,
    CO.hacker_id,
    CO.name,
    COL.college_id,
    CH.challenge_id
    FROM CONTESTS CO
    LEFT JOIN COLLEGES COL
    ON COL.contest_id = CO.contest_id
    LEFT JOIN CHALLENGES CH
    ON CH.college_id = COL.college_id
    GROUP BY 
    CO.contest_id,
    CO.hacker_id,
    CO.name,
    COL.college_id,
    CH.challenge_id
) A1
LEFT JOIN 
(
    SELECT V.challenge_id, 
    SUM(V.total_views) as "total_views",
    SUM(V.total_unique_views)as "total_unique_views"
    FROM View_Stats V
    GROUP BY V.challenge_id
) T1
ON T1.challenge_id = A1.challenge_id
GROUP BY
A1.contest_id,
A1.hacker_id,
A1.name
HAVING 
    SUM(T1.total_views) > 0 
OR SUM(T1.total_unique_views) > 0

---------------------------------------------------------------------
UNION ALL
---------------------------------------------------------------------

SELECT
A2.contest_id,
A2.hacker_id,
A2.name,
SUM(T2.total_submissions)as "total_submissions",
SUM(T2.total_accepted_submissions) as "total_accepted_submissions",
0 as "total_views",
0 as "total_unique_views"
FROM
(
    SELECT 
    CO.contest_id,
    CO.hacker_id,
    CO.name,
    COL.college_id,
    CH.challenge_id
    FROM CONTESTS CO
    LEFT JOIN COLLEGES COL
    ON COL.contest_id = CO.contest_id
    LEFT JOIN CHALLENGES CH
    ON CH.college_id = COL.college_id
    GROUP BY 
    CO.contest_id,
    CO.hacker_id,
    CO.name,
    COL.college_id,
    CH.challenge_id
) A2
LEFT JOIN 
(
    SELECT S.challenge_id, 
    SUM(S.total_submissions) as "total_submissions",
    SUM(S.total_accepted_submissions) as "total_accepted_submissions"
    FROM Submission_Stats S
    GROUP BY S.challenge_id
) T2
ON T2.challenge_id = A2.challenge_id
GROUP BY
A2.contest_id,
A2.hacker_id,
A2.name
HAVING 
    SUM(T2.total_submissions) > 0 
OR SUM(T2.total_accepted_submissions) > 0
) T
GROUP BY 
T.contest_id,
T.hacker_id,
T.name
ORDER BY 1 ASC
