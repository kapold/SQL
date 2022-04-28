USE UNIVER;
GO

CREATE FUNCTION FFACPUL(@facultyNumber varchar(50), @pulpitNumber varchar(50)) RETURNS TABLE AS 
	RETURN SELECT f.FACULTY_NAME [���������], 
				  p.PULPIT_NAME [�������]
		   FROM FACULTY as f
		   LEFT OUTER JOIN PULPIT as p
		   ON f.FACULTY = p.FACULTY
		   WHERE f.FACULTY = isnull(@facultyNumber, f.FACULTY)
				 AND
				 p.PULPIT = isnull(@pulpitNumber, p.PULPIT);
GO

SELECT * FROM dbo.FFACPUL(NULL, NULL);
SELECT * FROM dbo.FFACPUL('���', NULL);
SELECT * FROM dbo.FFACPUL(NULL, '����');
SELECT * FROM dbo.FFACPUL('���', '����');