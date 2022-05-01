CREATE TRIGGER TR_TEACHER on TEACHER after INSERT, DELETE, UPDATE AS
	BEGIN
		DECLARE @a1 char(10),     -- teacher
				@a2 varchar(100), -- teacher_name
				@a3 char(1),      -- gender
				@a4 char(20),     -- pulpit
				@in varchar(300);
		DECLARE @ins int = (SELECT count(*) FROM INSERTED),
				@del int = (SELECT count(*) FROM DELETED);

		IF @ins > 0 and @del = 0
		BEGIN
			PRINT 'Событие: INSERT';
			SET @a1 = (SELECT [TEACHER] FROM INSERTED);
			SET @a2 = (SELECT [TEACHER_NAME] FROM INSERTED);
			SET @a3 = (SELECT [GENDER] FROM INSERTED);
			SET @a4 = (SELECT [PULPIT] FROM INSERTED);
			SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
			INSERT INTO TR_AUDIT(STMT, TRNAME, CC) 
				VALUES('INS', 'TR_TEACHER_INS', @in);
		END

		ELSE
		IF @ins = 0 and @del > 0
		BEGIN
			PRINT 'Событие: DELETE';
			SET @a1 = (SELECT [TEACHER] FROM DELETED);
			SET @a2 = (SELECT [TEACHER_NAME] FROM DELETED);
			SET @a3 = (SELECT [GENDER] FROM DELETED);
			SET @a4 = (SELECT [PULPIT] FROM DELETED);
			SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
			INSERT INTO TR_AUDIT(STMT, TRNAME, CC) 
				VALUES('DEL', 'TR_TEACHER_DEL', @in);
		END

		ELSE
		IF @ins > 0 and @del > 0
		BEGIN
			PRINT 'Событие: UPDATE';
			SET @a1 = (SELECT [TEACHER] FROM INSERTED);
			SET @a2 = (SELECT [TEACHER_NAME] FROM INSERTED);
			SET @a3 = (SELECT [GENDER] FROM INSERTED);
			SET @a4 = (SELECT [PULPIT] FROM INSERTED);
			SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
			INSERT INTO TR_AUDIT(STMT, TRNAME, CC) 
				VALUES('UPD', 'TR_TEACHER_UPD', @in);
		END

		RETURN;
	END
GO

SET NOCOUNT ON;
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
	VALUES('АВАТМО', 'Адамович Антон Максимович', 'м', 'ИСиТ');
UPDATE TEACHER SET TEACHER = 'АВАТМО' WHERE TEACHER = 'ХЕЛЛОУ';
DELETE FROM TEACHER WHERE TEACHER = 'ХЕЛЛОУ';

SELECT * FROM TR_AUDIT;