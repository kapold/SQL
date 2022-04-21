SET NOCOUNT ON;

DECLARE @c int,
		@flag char = 'f';

SET IMPLICIT_TRANSACTIONS ON
	CREATE TABLE #TimeTable
	(
		k int
	);

	INSERT #TimeTable VALUES (1), (2), (3);
	SET @c = (SELECT count(*) FROM #TimeTable);
	PRINT '���������� ����� �� ��������� �������: ' + cast(@c as varchar(2));
	IF @flag = 'c'
		COMMIT;
	ELSE
		ROLLBACK;
SET IMPLICIT_TRANSACTIONS OFF

IF EXISTS (SELECT * FROM #TimeTable)
	PRINT '��������� ������� ����������';
ELSE
	PRINT '��������� ������� ���';