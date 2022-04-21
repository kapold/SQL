USE UNIVER
GO

ALTER PROCEDURE PSUBJECT @p varchar(20), @c int output AS
    BEGIN
        DECLARE @count int = (SELECT count(*) FROM SUBJECT);
        SELECT SUBJECT [Код],
               SUBJECT_NAME [Дисциплина],
               PULPIT [Кафедра]
        FROM SUBJECT
		WHERE SUBJECT = @p;
		SET @c = @@ROWCOUNT;
        RETURN @count;
    END;
GO;

set nocount on;
DECLARE @k int = 0, @r int = 0, @p varchar(20) = 'КГ';
    EXEC @k = PSUBJECT @p, @c = @r output;
PRINT 'Кол-во строк в SUBJECT: ' + cast(@k as nvarchar(3));
PRINT 'Кол-во дисциплин ' + cast(@p as nvarchar(30)) + ': ' + cast(@r as nvarchar(3));
GO