USE UNIVER;

SELECT p.SUBJECT [����������],
	   p.NOTE [������],
	   count(p.IDSTUDENT) [���-�� ���������]
FROM PROGRESS AS p
GROUP BY p.SUBJECT,
		 p.NOTE
HAVING p.NOTE IN (8, 9)