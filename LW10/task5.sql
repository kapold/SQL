DECLARE @tn char(20),
		@tc real,
		@tk int;


DECLARE ProgressCursor CURSOR LOCAL DYNAMIC FOR
	SELECT SUBJECT [Предмет],
		   IDSTUDENT [Студент],
		   NOTE [Оценка]
	FROM PROGRESS FOR UPDATE;

OPEN ProgressCursor;
	FETCH ProgressCursor INTO @tn, @tc, @tk;
	DELETE PROGRESS WHERE CURRENT OF ProgressCursor;
	FETCH ProgressCursor INTO @tn, @tc, @tk;
	UPDATE PROGRESS SET NOTE = NOTE + 1
		WHERE CURRENT OF ProgressCursor;
CLOSE ProgressCursor;