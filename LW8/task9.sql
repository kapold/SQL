BEGIN TRY
	PRINT 'Ошибка' + @@ROWCOUNT
END TRY

BEGIN CATCH
	PRINT 'Номер ошибки: ' + cast(ERROR_NUMBER() AS varchar)
	PRINT 'Сообщение ошибки: ' + cast(ERROR_MESSAGE() AS varchar)
	PRINT 'Строка ошибки: ' + cast(ERROR_LINE() AS varchar)
	PRINT 'Ошибка процедуры: ' + cast(ERROR_PROCEDURE() AS varchar)
	PRINT 'Строгость ошибки: ' + cast(ERROR_SEVERITY() AS varchar)
	PRINT 'Состояние ошибки: ' + cast(ERROR_STATE() AS varchar)
END CATCH