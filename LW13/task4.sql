USE UNIVER;
GO

CREATE FUNCTION FCTEACHER(@p varchar(50)) RETURNS INT AS
	BEGIN
		DECLARE @rc int = (SELECT count(*) FROM TEACHER
						   WHERE PULPIT = isnull(@p, PULPIT));
		RETURN @rc;
	END
GO

SELECT PULPIT, dbo.FCTEACHER(PULPIT) [Количество преподавателей]
FROM TEACHER;

SELECT dbo.FCTEACHER(NULL) [Всего преподавателей]