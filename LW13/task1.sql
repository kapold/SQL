USE UNIVER;
GO

CREATE FUNCTION COUNT_STUDENTS(@faculty varchar(20)) returns int AS
	BEGIN
		DECLARE @rc int = 0;
		SET @rc = (SELECT count(IDSTUDENT)
				   FROM STUDENT as s
				   INNER JOIN GROUPS as g
				   ON s.IDGROUP = g.IDGROUP
				   INNER JOIN FACULTY as f
				   ON g.FACULTY = f.FACULTY
				   WHERE f.FACULTY = @faculty);
		RETURN @rc;
	END
GO

DECLARE @result int = dbo.COUNT_STUDENTS('ИТ');
PRINT 'Количество студентов на факультете ИТ: ' + cast(@result as varchar(4));
GO

-- ALTER
ALTER FUNCTION dbo.COUNT_STUDENTS(@faculty varchar(20) = null, @prof varchar(20) = null) RETURNS INT AS
	BEGIN
		DECLARE @rc int = 0;
		SET @rc = (SELECT count(IDSTUDENT)
				   FROM STUDENT as s
				   INNER JOIN GROUPS as g
				   ON s.IDGROUP = g.IDGROUP
				   INNER JOIN FACULTY as f
				   ON g.FACULTY = f.FACULTY
				   WHERE g.PROFESSION = @prof AND f.FACULTY = @faculty);
		RETURN @rc;
	END
GO

DECLARE @result int = dbo.COUNT_STUDENTS(default, default);
PRINT 'Количество студентов на факультете ИТ: ' + cast(@result as varchar(4));
GO