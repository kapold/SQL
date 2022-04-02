-- Создаем временную таблицу
CREATE TABLE #TimeTable
(
	tKey int,
	CC int identity(1, 1),
	TF varchar(100)
);

SET nocount on; -- Не выводить сообщение о строке

-- Заполняем таблицу
DECLARE @i int = 0;
WHILE @i < 10000
BEGIN
	INSERT #TimeTable(tKey, TF)
		VALUES(floor(30000 * RAND()), replicate('Строка', 10))
		SET @i = @i + 1;
END

-- Index
CREATE INDEX #TimeTable_Where on #TimeTable(tKey)
WHERE (tKey >= 15000 AND tKey < 20000);

-- Запрос
SELECT tKey FROM #TimeTable
WHERE tKey > 15000 AND tKey < 20000;