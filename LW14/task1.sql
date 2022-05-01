-- Создание таблицы
CREATE TABLE TR_AUDIT
(
	ID int identity, -- номер
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')), -- DML-оператор
	TRNAME varchar(50), -- имя триггера
	CC varchar(300) -- комментарий
)

GO
-- Задание
CREATE TRIGGER TR_TEACHER_INS ON TEACHER after INSERT AS
	BEGIN
		DECLARE @a1 char(10),     -- teacher
				@a2 varchar(100), -- teacher_name
				@a3 char(1),      -- gender
				@a4 char(20),     -- pulpit
				@in varchar(300);
		PRINT 'Операция вставки';
		SET @a1 = (SELECT [TEACHER] FROM INSERTED);
		SET @a2 = (SELECT [TEACHER_NAME] FROM INSERTED);
		SET @a3 = (SELECT [GENDER] FROM INSERTED);
		SET @a4 = (SELECT [PULPIT] FROM INSERTED);
		SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
		INSERT INTO TR_AUDIT(STMT, TRNAME, CC) 
			VALUES('INS', 'TR_TEACHER_INS', @in);
		RETURN;
	END
GO

INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
	VALUES('АВАТМО', 'Адамович Антон Максимович', 'м', 'ИСиТ');

SELECT * FROM TR_AUDIT;