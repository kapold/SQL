CREATE TRIGGER TRANS_TRIGGER on TEACHER after INSERT, DELETE, UPDATE AS
		DECLARE @c int = (SELECT count(*) FROM TEACHER WHERE TEACHER = 'ААААА');
		IF(@c > 0)
		BEGIN
			RAISERROR('Код учителя не может быть ААААА', 10, 1);
			ROLLBACK;
		END;
		RETURN;
GO

UPDATE TEACHER SET TEACHER = 'ААААА' WHERE TEACHER = 'УРБ';
