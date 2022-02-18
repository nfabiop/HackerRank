SELECT MS2.hacker_id, H.name, MS2.total_score
FROM 
(
SELECT MS1.hacker_id, SUM(MS1.max_scores_1) as "total_score"
FROM
    (
    select hacker_id, challenge_id, MAX(score) as "max_scores_1"
    FROM SUBMISSIONS
    GROUP BY hacker_id, challenge_id
    ) MS1
GROUP BY MS1.hacker_id
HAVING SUM(MS1.max_scores_1) > 0
) MS2
LEFT  JOIN HACKERS H
ON H.hacker_id = MS2.hacker_id
ORDER BY MS2.total_score DESC, MS2.hacker_id ASC