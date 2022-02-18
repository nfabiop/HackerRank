SELECT T2.hacker_id, H.name
FROM
(
SELECT T.hacker_id, COUNT(T.challenge_id) AS "challenges"
FROM
(
SELECT SC.*
FROM
(
SELECT S.*,C.difficulty_level
FROM SUBMISSIONS AS S
LEFT JOIN CHALLENGES AS C
ON C.challenge_id = S.challenge_id
) SC
INNER JOIN DIFFICULTY AS D
ON D.difficulty_level = SC.difficulty_level
WHERE SC.score = D.score
) T
GROUP BY T.hacker_id
HAVING COUNT(T.challenge_id) > 1
) T2
LEFT JOIN Hackers AS H
ON H.hacker_id = T2.hacker_id
ORDER BY T2.challenges DESC, T2.hacker_id ASC