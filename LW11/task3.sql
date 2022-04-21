DECLARE @point varchar(32);

BEGIN TRY
	BEGIN TRAN
		DELETE PROGRESS WHERE SUBJECT = '��';
		SET @point = 'p1'; SAVE TRAN @point; -- ��1
		INSERT PROGRESS VALUES ('��', 1004, '2022-12-04', 10);
		SET @point = 'p2'; SAVE TRAN @point; -- ��2
		INSERT PROGRESS VALUES ('��', 1005, '2022-12-04', 10);
	COMMIT TRAN;
END TRY
BEGIN CATCH
	PRINT '������: ' + CASE
		WHEN error_number() = 2627 AND
			 patindex('%PK_PROGRESS%', error_message()) > 0
		THEN
			'������������'
		ELSE
			'����������� ������: ' + cast(error_number() as varchar(5)) + error_message()
		END;
		IF @@TRANCOUNT > 0
			BEGIN
				PRINT '����������� �����: ' + @point;
				ROLLBACK TRAN @point; -- ����� � ��
				COMMIT TRAN; -- �������� ��������� �� ��
			END;
END CATCH;