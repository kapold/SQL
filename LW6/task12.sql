USE UNIVER;

SELECT g.IDGROUP [������],
	   count(s.IDGROUP) [���-�� ��������� � ������],
	   count(s.IDSTUDENT) [����� � ������������]
FROM FACULTY AS f
	 INNER JOIN GROUPS AS g
	 ON f.FACULTY = g.FACULTY
	 INNER JOIN STUDENT AS s
	 ON g.IDGROUP = s.IDGROUP
GROUP BY g.IDGROUP