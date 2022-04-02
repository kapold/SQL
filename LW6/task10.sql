USE UNIVER;

SELECT p.SUBJECT [Дисциплина],
	   p.NOTE [Оценка],
	   count(p.IDSTUDENT) [Кол-во студентов]
FROM PROGRESS AS p
GROUP BY p.SUBJECT,
		 p.NOTE
HAVING p.NOTE IN (8, 9)