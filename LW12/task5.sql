USE UNIVER;
GO

CREATE PROCEDURE SUBJECT_REPORT @p char(50) AS
	BEGIN
		DECLARE @rc int = 0;
		BEGIN TRY
			DECLARE @tv char(20), @t char(300) = '';
			DECLARE SubjectCursor CURSOR FOR
				SELECT SUBJECT_NAME FROM SUBJECT WHERE PULPIT = @p;
				IF NOT EXISTS (SELECT SUBJECT_NAME FROM SUBJECT WHERE PULPIT = @p)
					RAISERROR('Ошибка', 11, 1);
				ELSE
					OPEN SubjectCursor;
					FETCH SubjectCursor INTO @tv;
					PRINT 'Список дисциплин';
					WHILE @@FETCH_STATUS = 0
						BEGIN
							SET @t = rtrim(@tv) + ',' + @t;
							SET @rc = @rc + 1;
							FETCH SubjectCursor INTO @tv;
						END;
					CLOSE SubjectCursor;
					RETURN @rc;
		END TRY
		BEGIN CATCH
			PRINT 'Ошибка в параметрах'
			IF ERROR_PROCEDURE() IS NOT NULL
				PRINT 'Имя процедуры: ' + ERROR_PROCEDURE();
			RETURN @rc;
		END CATCH
	END
GO

DECLARE @rc int;
EXEC @rc = SUBJECT_REPORT @p = 'ИСиТ';
PRINT 'Количество дисциплин: ' + cast(@rc as varchar(3));