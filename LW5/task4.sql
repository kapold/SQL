USE UNIVER;

SELECT A1.AUDITORIUM_NAME [???????? ?????????],
	   A1.AUDITORIUM_CAPACITY [???????????],
	   A1.AUDITORIUM_TYPE [???]
FROM AUDITORIUM AS A1
WHERE AUDITORIUM_CAPACITY = (SELECT TOP(1) A2.AUDITORIUM_CAPACITY
					FROM AUDITORIUM AS A2
					WHERE A1.AUDITORIUM_TYPE = A2.AUDITORIUM_TYPE
					ORDER BY AUDITORIUM_CAPACITY desc);