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

-- ������� ������ ��������
CREATE INDEX #TimeTable_tKey on #TimeTable(tKey) INCLUDE (CC);

-- ������
SELECT CC FROM #TimeTable
WHERE tKey > 5000;