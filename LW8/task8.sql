DECLARE @i int = 0;

WHILE @i < 99
	IF(@i = 12) RETURN;
	ELSE
		BEGIN
			PRINT @i;
			SET @i = @i + 1;
		END