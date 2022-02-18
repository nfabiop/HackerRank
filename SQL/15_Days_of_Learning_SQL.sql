
DECLARE @min_date as date
SET @min_date = (SELECT MIN(submission_date) FROM SUBMISSIONS)
--################################################################


SELECT 
Z1.submission_date,
Z1.max_number_of_submissions,
Z2.hacker_id,
Z2.name
FROM
(
SELECT 
T.submission_date,
SUM(sub_diaria) as "max_number_of_submissions"
FROM
    (
    SELECT 
    A.submission_date, 
    A.hacker_id,
    A.ranking,
    A.sub_diaria
    FROM
        (
        SELECT
        S.submission_date, 
        S.hacker_id,
        S.ranking,
        CASE
           WHEN DATEDIFF(DAY, @min_date, S.submission_date)+ 1 =  ranking THEN 1
           ELSE 0
        END as "sub_diaria"
        FROM
            (
            SELECT 
            submission_date, 
            hacker_id,
            RANK() OVER(PARTITION BY hacker_id ORDER BY submission_date) as "ranking"
            FROM SUBMISSIONS
            GROUP BY submission_date, hacker_id
            ) S
        ) A 
    WHERE A.sub_diaria = 1
    ) T
GROUP BY T.submission_date
) Z1
LEFT JOIN
(
SELECT Y.submission_date, Y.hacker_id, H1.name
FROM
(
SELECT 
X.submission_date,
X.hacker_id,
X.num_submissions,
X.orden_sub_diaria,
RANK() OVER(PARTITION BY X.submission_date ORDER BY X.num_submissions DESC,  X.hacker_id ASC) AS "ranking_hacker"
FROM
(
SELECT 
S3.submission_date, 
S3.hacker_id,
S3.num_submissions,
B2.sub_diaria,
CASE WHEN (B2.sub_diaria = 1) THEN 1
     ELSE 2
END AS "orden_sub_diaria"
FROM
(
SELECT 
submission_date, 
hacker_id,
COUNT(submission_id) as "num_submissions"
FROM SUBMISSIONS
GROUP BY submission_date, hacker_id
) S3
LEFT JOIN
(
SELECT 
A2.submission_date, 
A2.hacker_id,
--A2.ranking,
A2.sub_diaria
FROM
    (
    SELECT
    S2.submission_date, 
    S2.hacker_id,
    S2.ranking,
    CASE
       WHEN DATEDIFF(DAY, @min_date, S2.submission_date)+ 1 =  ranking THEN 1
       ELSE 0
    END as "sub_diaria"
    FROM
        (
        SELECT 
        submission_date, 
        hacker_id,
        RANK() OVER(PARTITION BY hacker_id ORDER BY submission_date) as "ranking"
        FROM SUBMISSIONS
        ) S2
    ) A2 
WHERE A2.sub_diaria = 1
) B2
ON (B2.submission_date = S3.submission_date) AND (B2.hacker_id = S3.hacker_id)
) X
GROUP BY
X.submission_date,
X.hacker_id,
X.num_submissions,
X.orden_sub_diaria
) Y
LEFT JOIN HACKERS H1
ON H1.hacker_id = Y.hacker_id
WHERE Y.ranking_hacker = 1
) Z2
ON Z2.submission_date = Z1.submission_date
ORDER BY 1 ASC


