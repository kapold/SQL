CREATE VIEW [����������_���������] (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE) AS
	SELECT AUDITORIUM.AUDITORIUM [���],
		   AUDITORIUM.AUDITORIUM_NAME [������������ ���������],
		   AUDITORIUM.AUDITORIUM_CAPACITY [�����������],
		   AUDITORIUM.AUDITORIUM_TYPE [��� ���������]
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE = '��' WITH CHECK OPTION;
GO

SELECT * FROM [����������_���������];

INSERT [����������_���������] VALUES ('900-1', '900-1', 20, '��')
SELECT * FROM [����������_���������];

UPDATE [����������_���������] SET AUDITORIUM = '901-1' WHERE AUDITORIUM_NAME = '900-1'
SELECT * FROM [����������_���������];

--DROP VIEW [����������_���������];