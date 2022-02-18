SELECT T.col_2
FROM
(
SELECT 1 as "col_1",'* * * * * * * * * * * * * * * * * * * *' as "col_2"
UNION
SELECT 2 as "col_1",'* * * * * * * * * * * * * * * * * * *'  as "col_2"
UNION
SELECT 3 as "col_1",'* * * * * * * * * * * * * * * * * *'
UNION
SELECT 4 as "col_1",'* * * * * * * * * * * * * * * * *'
UNION
SELECT 5 as "col_1",'* * * * * * * * * * * * * * * *'
UNION
SELECT 6 as "col_1",'* * * * * * * * * * * * * * *'
UNION
SELECT 7 as "col_1",'* * * * * * * * * * * * * *'
UNION
SELECT 8 as "col_1",'* * * * * * * * * * * * *'
UNION
SELECT 9 as "col_1",'* * * * * * * * * * * *'
UNION
SELECT 10 as "col_1",'* * * * * * * * * * *'
UNION
SELECT 11 as "col_1",'* * * * * * * * * *'
UNION
SELECT 12 as "col_1",'* * * * * * * * *'
UNION
SELECT 13 as "col_1",'* * * * * * * *'
UNION
SELECT 14 as "col_1",'* * * * * * *'
UNION
SELECT 15 as "col_1",'* * * * * *'
UNION
SELECT 16 as "col_1",'* * * * *'
UNION
SELECT 17 as "col_1",'* * * *'
UNION
SELECT 18 as "col_1",'* * *'
UNION
SELECT 19 as "col_1",'* *'
UNION
SELECT 20 as "col_1",'*'
) T
ORDER BY T.col_1 ASC
