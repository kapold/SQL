-- ��������� ������
DECLARE GoodsCursor CURSOR LOCAL FOR
	SELECT ������������_������,
		   ����
	FROM ������;

DECLARE @good nvarchar(20),
		@price real;

OPEN GoodsCursor;
	FETCH GoodsCursor INTO @good, @price;
	PRINT '1. ' + @good + cast(@price as varchar(6));
GO

DECLARE @good nvarchar(20),
		@price real;
	FETCH GoodsCursor INTO @good, @price;
	PRINT '2. ' + @good + cast(@price as varchar(6));
GO

-- ���������� ������
DECLARE GoodsCursor CURSOR GLOBAL FOR
	SELECT ������������_������,
		   ����
	FROM ������;

DECLARE @good nvarchar(20),
		@price real;

OPEN GoodsCursor;
	FETCH GoodsCursor INTO @good, @price;
	PRINT '1. ' + @good + cast(@price as varchar(6));
GO

DECLARE @good nvarchar(20),
		@price real;
	FETCH GoodsCursor INTO @good, @price;
	PRINT '2. ' + @good + cast(@price as varchar(6));
	CLOSE GoodsCursor;
	DEALLOCATE GoodsCursor;
GO