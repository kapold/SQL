CREATE VIEW [Дисциплины] AS 
	SELECT TOP(10) SUBJECT.PULPIT [Код кафедры],
		SUBJECT.SUBJECT [Код],
		SUBJECT.SUBJECT_NAME [Наименование дисциплины]
	FROM SUBJECT
	ORDER BY SUBJECT.SUBJECT_NAME;
GO

--DROP VIEW [Дисциплины];