SELECT T.id, T.age, T.coins_needed, T.power
FROM 
(
SELECT W3.id, W2.age, W2.code, W2.power, W2.coins_needed 
FROM
(
SELECT P1.age, P1.code, W1.power, MIN(W1.coins_needed) as "coins_needed"
FROM WANDS as W1
LEFT JOIN WANDS_PROPERTY as P1
ON P1.code = W1.code
GROUP BY P1.age, P1.code, W1.power
) W2
LEFT JOIN WANDS as W3
ON (W3.code = W2.code AND 
    W3.coins_needed = W2.coins_needed AND 
    W3.power = W2.power)
) T
LEFT JOIN WANDS_PROPERTY as P2
ON P2.code = T.code
WHERE P2.is_evil = 0
ORDER BY T.power DESC, T.age DESC
