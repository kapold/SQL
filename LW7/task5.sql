CREATE VIEW [����������] AS 
	SELECT TOP(10) SUBJECT.PULPIT [��� �������],
		SUBJECT.SUBJECT [���],
		SUBJECT.SUBJECT_NAME [������������ ����������]
	FROM SUBJECT
	ORDER BY SUBJECT.SUBJECT_NAME;
GO

--DROP VIEW [����������];