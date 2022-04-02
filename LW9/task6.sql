-- ������� ��������� �������
CREATE TABLE #TimeTable
(
	tKey int,
	CC int identity(1, 1),
	TF varchar(100)
);

SET nocount on; -- �� �������� ��������� � ������

-- ��������� �������
DECLARE @i int = 0;
WHILE @i < 10000
BEGIN
	INSERT #TimeTable(tKey, TF)
		VALUES(floor(30000 * RAND()), replicate('������', 10))
		SET @i = @i + 1;
END

-- ������ �� ��������� FILLFACTOR 65
DROP INDEX #TimeTable_tKey ON #TimeTable;
CREATE INDEX #TimeTable_tKey ON #TimeTable(tKey)
WITH (FILLFACTOR = 65);

-- ���� � ������������
INSERT TOP(50)PERCENT INTO #TimeTable(tKey, TF) 
SELECT tKey, TF  
FROM #TimeTable;
SELECT name [������], 
	   avg_fragmentation_in_percent [������������ (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),    
       OBJECT_ID(N'#EX'), NULL, NULL, NULL) AS ss  
	   JOIN sys.indexes AS ii 
       ON ss.object_id = ii.object_id AND ss.index_id = ii.index_id  
       WHERE name IS NOT NULL;