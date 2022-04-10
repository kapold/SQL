-- СТАТИЧЕСКИЙ курсор
DECLARE @subj nvarchar(20),
		@date char(10),
		@note char(1);
DECLARE SubjectCursor CURSOR LOCAL STATIC FOR
	SELECT SUBJECT [Предмет],
		   PDATE [Дата],
		   NOTE [Оценка]
	FROM PROGRESS;

OPEN SubjectCursor;
	PRINT 'Количество строк: ' + cast(@@CURSOR_ROWS as varchar(5));
	UPDATE PROGRESS SET NOTE = 8 WHERE SUBJECT = 'ОАиП';
	FETCH SubjectCursor INTO @subj, @date, @note;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @subj + ' ' + @date + ' ' + @note;
		FETCH SubjectCursor INTO @subj, @date, @note;
	END
CLOSE SubjectCursor;
go

-- ДИНАМИЧЕСКИЙ курсор
DECLARE @subj nvarchar(20),
		@date char(10),
		@note char(1);
DECLARE SubjectCursor CURSOR LOCAL DYNAMIC FOR
	SELECT SUBJECT [Предмет],
		   PDATE [Дата],
		   NOTE [Оценка]
	FROM PROGRESS;

OPEN SubjectCursor;
	PRINT 'Количество строк: ' + cast(@@CURSOR_ROWS as varchar(5));
	UPDATE PROGRESS SET NOTE = 10 WHERE SUBJECT = 'КГ';
	FETCH SubjectCursor INTO @subj, @date, @note;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @subj + ' ' + @date + ' ' + @note;
		FETCH SubjectCursor INTO @subj, @date, @note;
	END
CLOSE SubjectCursor;