USE UNIVER;

SELECT g.PROFESSION [�������������],
	   p.SUBJECT [����������], 
	   avg(p.NOTE) [������� ������]
FROM GROUPS AS g
	 INNER JOIN STUDENT AS s
	 ON g.IDGROUP = s.IDGROUP
	 INNER JOIN PROGRESS AS p
	 ON s.IDSTUDENT = p.IDSTUDENT
WHERE g.FACULTY = '���'
GROUP BY g.PROFESSION,
		 p.SUBJECT

EXCEPT

SELECT g.PROFESSION [�������������],
	   p.SUBJECT [����������], 
	   avg(p.NOTE) [������� ������]
FROM GROUPS AS g
	 INNER JOIN STUDENT AS s
	 ON g.IDGROUP = s.IDGROUP
	 INNER JOIN PROGRESS AS p
	 ON s.IDSTUDENT = p.IDSTUDENT
WHERE g.FACULTY = '����'
GROUP BY g.PROFESSION,
		 p.SUBJECT