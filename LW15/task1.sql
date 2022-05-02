USE UNIVER
GO

SELECT [TEACHER].TEACHER [Код],
	   [TEACHER].TEACHER_NAME [ФИО_преподавателя],
	   [TEACHER].PULPIT [Факультет]
FROM TEACHER
WHERE PULPIT = 'ИСиТ'
FOR XML PATH('Код');