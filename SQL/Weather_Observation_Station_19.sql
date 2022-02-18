DECLARE 
@a AS DECIMAL(8,5),
@b AS DECIMAL(8,5),
@c AS DECIMAL(8,5),
@d AS DECIMAL(8,5),
@resultado AS DECIMAL(8,4)
SET @a = (SELECT MIN(LAT_N)   FROM station)
SET @b = (SELECT MIN(LONG_W)  FROM station)
SET @c = (SELECT MAX(LAT_N)   FROM station)
SET @d = (SELECT MAX(LONG_W)  FROM station)
SET @resultado = (SELECT SQRT(SQUARE(@a-@c) + SQUARE(@b-@d)))
SELECT ROUND(@resultado, 4) 

;