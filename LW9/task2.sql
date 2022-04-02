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

-- Запрос
SELECT count(*) [Количество строк] FROM #TimeTable;
SELECT * FROM #TimeTable;

-- Создаем некластеризованный неуникальный составной индекс
CREATE INDEX #TimeTable_NonClust on #TimeTable(tKey, CC)

-- Этот индекс не применяется оптимизатором ни при фильтрации, ни при сортировке строк таблицы #TimeTable
SELECT * FROM #TimeTable 
WHERE tKey > 1500 and CC < 4500;  
SELECT * FROM #TimeTable 
ORDER BY tKey, CC

-- Если хотя бы одно из индексируемых значений зафиксировать (задать одно значение), то оптимизатор применит индекс
SELECT * FROM #TimeTable 
WHERE tKey = 556 and  CC > 3