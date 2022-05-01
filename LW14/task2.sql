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
CREATE TRIGGER TR_TEACHER_DEL on TEACHER after DELETE AS
	BEGIN
		DECLARE @a1 char(10),     -- teacher
				@a2 varchar(100), -- teacher_name
				@a3 char(1),      -- gender
				@a4 char(20),     -- pulpit
				@in varchar(300);
		PRINT 'Операция удаления';
		SET @a1 = (SELECT [TEACHER] FROM DELETED);
		SET @a2 = (SELECT [TEACHER_NAME] FROM DELETED);
		SET @a3 = (SELECT [GENDER] FROM DELETED);
		SET @a4 = (SELECT [PULPIT] FROM DELETED);
		SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
		INSERT INTO TR_AUDIT(STMT, TRNAME, CC) 
			VALUES('DEL', 'TR_TEACHER_DEL', @in);
		RETURN;
	END
GO

DELETE FROM TEACHER WHERE TEACHER = 'АВАТМО';

SELECT * FROM TR_AUDIT;