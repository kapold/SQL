USE UNIVER
GO

SELECT [TEACHER].TEACHER [���],
	   [TEACHER].TEACHER_NAME [���_�������������],
	   [TEACHER].PULPIT [���������]
FROM TEACHER
WHERE PULPIT = '����'
FOR XML PATH('���');