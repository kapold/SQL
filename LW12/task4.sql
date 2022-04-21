USE UNIVER;
GO

CREATE PROCEDURE PAUDITORIUM_INSERT @a char(20), @n varchar(50), @c int = 0, @t char(10) AS
	BEGIN
		DECLARE @rc int = 1;
		BEGIN TRY
			INSERT INTO AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
				VALUES (@a, @t, @c, @n);
		END TRY
		BEGIN CATCH
			PRINT 'Номер ошибки: ' + cast(ERROR_NUMBER() as varchar(6));
			PRINT 'Сообщение: ' + ERROR_MESSAGE();
			PRINT 'Уровень: ' + cast(ERROR_SEVERITY() as varchar(6));
			PRINT 'Метка: ' + cast(ERROR_STATE() as varchar(8));
			PRINT 'Номер строки: ' + cast(ERROR_LINE() as varchar(8));
			IF ERROR_PROCEDURE() IS NOT NULL
				PRINT 'Имя процедуры: ' + ERROR_PROCEDURE();
			RETURN -1;
		END CATCH;
	END
GO

DECLARE @rc int;
EXEC @rc = PAUDITORIUM_INSERT @a = '665-6', @n = '665-6', @c = 66,  @t = 'ЛК';
PRINT 'Код ошибки: ' + cast(@rc as varchar(3));