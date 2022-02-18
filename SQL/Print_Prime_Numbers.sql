DECLARE @prime_list AS NVARCHAR(2000)
DECLARE @counter AS INT 
DECLARE @j AS INT 
DECLARE @raiz  AS INT 
DECLARE @counter_esprimo AS INT

SET @counter=3
SET @prime_list = '2'


WHILE ( @counter <= 1000)
BEGIN
    
    SET @raiz = CAST(FLOOR(SQRT(@counter)) AS INT)
    
    SET @counter_esprimo = 1
    SET @j=2
    WHILE (@j <= @raiz)
    BEGIN
        IF (@counter % @j) = 0  
        BEGIN
            SET @counter_esprimo = 0
        END
        SET @j = @j+1
    END
    
    IF @counter_esprimo = 1
    BEGIN
        SET @prime_list = @prime_list + '&' + CONVERT(VARCHAR, @counter)
    END
    SET @counter = @counter + 1
END
PRINT @prime_list