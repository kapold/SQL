ALTER VIEW [Количество кафедр] WITH SCHEMABINDING AS
	SELECT f.FACULTY_NAME [Имя факультета],
		   count(p.PULPIT) [Количество кафедр]
	FROM dbo.FACULTY AS f
		 INNER JOIN dbo.PULPIT AS p
		 ON f.FACULTY = p.FACULTY
	GROUP BY f.FACULTY_NAME;
GO