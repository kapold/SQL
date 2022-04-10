-- ������� SCROLL
DECLARE UniverCursor CURSOR LOCAL DYNAMIC SCROLL FOR
	SELECT ROW_NUMBER() OVER (ORDER BY SUBJECT) [N],
									   SUBJECT [�������]
	FROM dbo.PROGRESS
	WHERE NOTE = '9'

DECLARE @tc int,
		@rn char(50);

OPEN UniverCursor;
	FETCH UniverCursor INTO @tc, @rn;
	PRINT '��������� ������:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH LAST FROM UniverCursor INTO @tc, @rn;
	PRINT '��������� ������:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH FIRST FROM UniverCursor INTO @tc, @rn;
	PRINT '������ ������:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH NEXT FROM UniverCursor INTO @tc, @rn;
	PRINT '��������� ������ �� �������:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH PRIOR FROM UniverCursor INTO @tc, @rn;
	PRINT '���������� ������ �� �������:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH ABSOLUTE 3 FROM UniverCursor INTO @tc, @rn;
	PRINT '������ ������ �� ������:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH RELATIVE 5 FROM UniverCursor INTO @tc, @rn;
	PRINT '����� ������ ������ �� �������:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
CLOSE UniverCursor;