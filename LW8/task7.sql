CREATE TABLE #TimeTbl
(
	ID int,
	AGE int,
	CLASS int
);

SET NOCOUNT ON; -- не выводить сообщения о вводе строк
DECLARE @i int = 0,
		@newAge int = 12,
		@newClass int = 6;

WHILE @i < 10
	BEGIN
		INSERT INTO #TimeTbl(AGE, CLASS)
			VALUES(@newAge + @i, @newClass + @i)
		SET @i = @i + 1;

		PRINT @i;
	END