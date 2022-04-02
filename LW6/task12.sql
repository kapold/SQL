USE UNIVER;

SELECT g.IDGROUP [Группа],
	   count(s.IDGROUP) [Кол-во студентов в группе],
	   count(s.IDSTUDENT) [Всего в университете]
FROM FACULTY AS f
	 INNER JOIN GROUPS AS g
	 ON f.FACULTY = g.FACULTY
	 INNER JOIN STUDENT AS s
	 ON g.IDGROUP = s.IDGROUP
GROUP BY g.IDGROUP