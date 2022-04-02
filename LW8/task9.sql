BEGIN TRY
	PRINT '������' + @@ROWCOUNT
END TRY

BEGIN CATCH
	PRINT '����� ������: ' + cast(ERROR_NUMBER() AS varchar)
	PRINT '��������� ������: ' + cast(ERROR_MESSAGE() AS varchar)
	PRINT '������ ������: ' + cast(ERROR_LINE() AS varchar)
	PRINT '������ ���������: ' + cast(ERROR_PROCEDURE() AS varchar)
	PRINT '��������� ������: ' + cast(ERROR_SEVERITY() AS varchar)
	PRINT '��������� ������: ' + cast(ERROR_STATE() AS varchar)
END CATCH