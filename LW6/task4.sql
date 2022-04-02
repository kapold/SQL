USE UNIVER;

SELECT f.FACULTY [��� ����������],
	   g.PROFESSION [�������������],
	   CASE
			WHEN g.YEAR_FIRST = 2013 then '1'
			WHEN g.YEAR_FIRST = 2012 then '2'
			WHEN g.YEAR_FIRST = 2011 then '3'
			WHEN g.YEAR_FIRST = 2010 then '4'
		END [����],
		round(avg(cast(p.NOTE as float(4))), 2) [������� ������]
FROM FACULTY AS f
	 INNER JOIN GROUPS AS g
	 ON f.FACULTY = g.FACULTY
	 INNER JOIN STUDENT AS s
	 ON g.IDGROUP = s.IDGROUP
	 INNER JOIN PROGRESS AS p
	 ON s.IDSTUDENT = p.IDSTUDENT
WHERE p.SUBJECT = '��' OR p.SUBJECT = '����'
GROUP BY f.FACULTY,
		 g.PROFESSION,
		 g.YEAR_FIRST