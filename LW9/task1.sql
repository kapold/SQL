exec SP_HELPINDEX AUDITORIUM
exec SP_HELPINDEX AUDITORIUM_TYPE
exec SP_HELPINDEX FACULTY
exec SP_HELPINDEX GROUPS
exec SP_HELPINDEX PROFESSION
exec SP_HELPINDEX PROGRESS
exec SP_HELPINDEX PULPIT
exec SP_HELPINDEX STUDENT
exec SP_HELPINDEX SUBJECT
exec SP_HELPINDEX TEACHER
exec SP_HELPINDEX TIMETABLE

CREATE TABLE #TestTable
(
	tID int,
	tField nvarchar(100)
);
GO

-- Заполняю временную БД числами
SET nocount on; -- не выводить сообщения о вводе строк
DECLARE @i int = 0;
WHILE @i < 1000
BEGIN
	INSERT #TestTable(tID, tField)
		VALUES(floor(20000*RAND()), REPLICATE('Строка', 10))
	IF(@i % 100 = 0) PRINT @i;
	SET @i = @i + 1;
END;

-- Получаю план запроса и определяю его стоимость:
-- Нажать Ctrl + L
SELECT * FROM #TestTable
WHERE tID between 1500 and 2500
ORDER BY tID

CHECKPOINT;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

CREATE CLUSTERED INDEX #TestTable_CL on #TestTable(tID asc)
