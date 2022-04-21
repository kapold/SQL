USE UNIVER
GO

ALTER PROCEDURE PSUBJECT @p varchar(20), @c int output AS
    BEGIN
        DECLARE @count int = (SELECT count(*) FROM SUBJECT);
        SELECT SUBJECT [���],
               SUBJECT_NAME [����������],
               PULPIT [�������]
        FROM SUBJECT
		WHERE SUBJECT = @p;
		SET @c = @@ROWCOUNT;
        RETURN @count;
    END;
GO;

set nocount on;
DECLARE @k int = 0, @r int = 0, @p varchar(20) = '��';
    EXEC @k = PSUBJECT @p, @c = @r output;
PRINT '���-�� ����� � SUBJECT: ' + cast(@k as nvarchar(3));
PRINT '���-�� ��������� ' + cast(@p as nvarchar(30)) + ': ' + cast(@r as nvarchar(3));
GO