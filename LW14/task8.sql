CREATE TRIGGER FAC_INSTEAD_OF on FACULTY instead of DELETE AS
	raiserror(N'Удаление запрещено', 10, 1);
	RETURN;
GO

DELETE FROM FACULTY WHERE FACULTY = 'ИТ';