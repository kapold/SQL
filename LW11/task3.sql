DECLARE @point varchar(32);

BEGIN TRY
	BEGIN TRAN
		DELETE PROGRESS WHERE SUBJECT = 'БД';
		SET @point = 'p1'; SAVE TRAN @point; -- КТ1
		INSERT PROGRESS VALUES ('БД', 1004, '2022-12-04', 10);
		SET @point = 'p2'; SAVE TRAN @point; -- КТ2
		INSERT PROGRESS VALUES ('БД', 1005, '2022-12-04', 10);
	COMMIT TRAN;
END TRY
BEGIN CATCH
	PRINT 'Ошибка: ' + CASE
		WHEN error_number() = 2627 AND
			 patindex('%PK_PROGRESS%', error_message()) > 0
		THEN
			'Дублирование'
		ELSE
			'Неизвестная ошибка: ' + cast(error_number() as varchar(5)) + error_message()
		END;
		IF @@TRANCOUNT > 0
			BEGIN
				PRINT 'Контрольная точка: ' + @point;
				ROLLBACK TRAN @point; -- откат к КТ
				COMMIT TRAN; -- фиксация изменений до КТ
			END;
END CATCH;