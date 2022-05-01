-- �������� �������
CREATE TABLE TR_AUDIT
(
	ID int identity, -- �����
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')), -- DML-��������
	TRNAME varchar(50), -- ��� ��������
	CC varchar(300) -- �����������
)

GO
-- �������
CREATE TRIGGER TR_TEACHER_UPD on TEACHER after UPDATE AS
	BEGIN
		DECLARE @a1 char(10),     -- teacher
				@a2 varchar(100), -- teacher_name
				@a3 char(1),      -- gender
				@a4 char(20),     -- pulpit
				@in varchar(300);
		PRINT '�������� ���������';
		SET @a1 = (SELECT [TEACHER] FROM INSERTED);
		SET @a2 = (SELECT [TEACHER_NAME] FROM INSERTED);
		SET @a3 = (SELECT [GENDER] FROM INSERTED);
		SET @a4 = (SELECT [PULPIT] FROM INSERTED);
		SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
		INSERT INTO TR_AUDIT(STMT, TRNAME, CC) 
			VALUES('UPD', 'TR_TEACHER_UPD', @in);
		RETURN;
	END
GO

UPDATE TEACHER SET TEACHER = '����' WHERE TEACHER = '���';

SELECT * FROM TR_AUDIT;