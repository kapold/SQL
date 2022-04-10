-- атрибут SCROLL
DECLARE UniverCursor CURSOR LOCAL DYNAMIC SCROLL FOR
	SELECT ROW_NUMBER() OVER (ORDER BY SUBJECT) [N],
									   SUBJECT [Предмет]
	FROM dbo.PROGRESS
	WHERE NOTE = '9'

DECLARE @tc int,
		@rn char(50);

OPEN UniverCursor;
	FETCH UniverCursor INTO @tc, @rn;
	PRINT 'Следующая строка:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH LAST FROM UniverCursor INTO @tc, @rn;
	PRINT 'Последняя строка:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH FIRST FROM UniverCursor INTO @tc, @rn;
	PRINT 'Первая строка:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH NEXT FROM UniverCursor INTO @tc, @rn;
	PRINT 'Следующая строка за текущей:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH PRIOR FROM UniverCursor INTO @tc, @rn;
	PRINT 'Предыдущая строка от текущей:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH ABSOLUTE 3 FROM UniverCursor INTO @tc, @rn;
	PRINT 'Третья строка от начала:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
	FETCH RELATIVE 5 FROM UniverCursor INTO @tc, @rn;
	PRINT 'Пятая строка вперед от текущей:	' + cast(@tc as nvarchar(3)) + rtrim(@rn);
CLOSE UniverCursor;