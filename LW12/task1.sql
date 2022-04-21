USE UNIVER;
GO;

CREATE PROCEDURE PSUBJECT AS
    BEGIN
        DECLARE @count int = (SELECT count(*) FROM SUBJECT);
        SELECT SUBJECT [Код],
               SUBJECT_NAME [Дисциплина],
               PULPIT [Кафедра]
        FROM SUBJECT;
        RETURN @count;
    END;
GO;

set nocount on;
DECLARE @k int = 0;
    EXEC @k = PSUBJECT;
PRINT 'Кол-во строк в SUBJECT: ' + cast(@k as nvarchar(3));