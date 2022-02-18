DECLARE @a AS DECIMAL(20,8),
@b AS DECIMAL(20,8),
@c AS DECIMAL(20,8),
@d AS DECIMAL(20,8),
@resultado DECIMAL(20,4)
SET @a = (SELECT MIN(LAT_N)   FROM station)
SET @b = (SELECT MIN(LONG_W)  FROM station)
SET @c = (SELECT MAX(LAT_N)   FROM station)
SET @d = (SELECT MAX(LONG_W)  FROM station)
SET @resultado = (SELECT @c-@a+@d-@b)
SELECT ROUND(@resultado, 4)
;