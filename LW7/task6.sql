ALTER VIEW [���������� ������] WITH SCHEMABINDING AS
	SELECT f.FACULTY_NAME [��� ����������],
		   count(p.PULPIT) [���������� ������]
	FROM dbo.FACULTY AS f
		 INNER JOIN dbo.PULPIT AS p
		 ON f.FACULTY = p.FACULTY
	GROUP BY f.FACULTY_NAME;
GO