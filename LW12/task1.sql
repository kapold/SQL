USE UNIVER;
GO;

CREATE PROCEDURE PSUBJECT AS
    BEGIN
        DECLARE @count int = (SELECT count(*) FROM SUBJECT);
        SELECT SUBJECT [���],
               SUBJECT_NAME [����������],
               PULPIT [�������]
        FROM SUBJECT;
        RETURN @count;
    END;
GO;

set nocount on;
DECLARE @k int = 0;
    EXEC @k = PSUBJECT;
PRINT '���-�� ����� � SUBJECT: ' + cast(@k as nvarchar(3));