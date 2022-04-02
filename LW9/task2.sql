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

-- ������
SELECT count(*) [���������� �����] FROM #TimeTable;
SELECT * FROM #TimeTable;

-- ������� ������������������ ������������ ��������� ������
CREATE INDEX #TimeTable_NonClust on #TimeTable(tKey, CC)

-- ���� ������ �� ����������� ������������� �� ��� ����������, �� ��� ���������� ����� ������� #TimeTable
SELECT * FROM #TimeTable 
WHERE tKey > 1500 and CC < 4500;  
SELECT * FROM #TimeTable 
ORDER BY tKey, CC

-- ���� ���� �� ���� �� ������������� �������� ������������� (������ ���� ��������), �� ����������� �������� ������
SELECT * FROM #TimeTable 
WHERE tKey = 556 and  CC > 3