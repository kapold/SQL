CREATE TRIGGER TRANS_TRIGGER on TEACHER after INSERT, DELETE, UPDATE AS
		DECLARE @c int = (SELECT count(*) FROM TEACHER WHERE TEACHER = '�����');
		IF(@c > 0)
		BEGIN
			RAISERROR('��� ������� �� ����� ���� �����', 10, 1);
			ROLLBACK;
		END;
		RETURN;
GO

UPDATE TEACHER SET TEACHER = '�����' WHERE TEACHER = '���';
