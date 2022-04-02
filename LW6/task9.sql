USE UNIVER;

SELECT g.PROFESSION [Специальность],
	   p.SUBJECT [Дисциплина], 
	   avg(p.NOTE) [Средняя оценка]
FROM GROUPS AS g
	 INNER JOIN STUDENT AS s
	 ON g.IDGROUP = s.IDGROUP
	 INNER JOIN PROGRESS AS p
	 ON s.IDSTUDENT = p.IDSTUDENT
WHERE g.FACULTY = 'ТОВ'
GROUP BY g.PROFESSION,
		 p.SUBJECT

EXCEPT

SELECT g.PROFESSION [Специальность],
	   p.SUBJECT [Дисциплина], 
	   avg(p.NOTE) [Средняя оценка]
FROM GROUPS AS g
	 INNER JOIN STUDENT AS s
	 ON g.IDGROUP = s.IDGROUP
	 INNER JOIN PROGRESS AS p
	 ON s.IDSTUDENT = p.IDSTUDENT
WHERE g.FACULTY = 'ХТиТ'
GROUP BY g.PROFESSION,
		 p.SUBJECT