USE UNIVER
GO

SELECT AUDITORIUM [������������_���������],
	   AUDITORIUM_TYPENAME [���_���������],
	   AUDITORIUM_CAPACITY [�����������]
FROM AUDITORIUM as a
INNER JOIN AUDITORIUM_TYPE as t
on a.AUDITORIUM_TYPE = t.AUDITORIUM_TYPE
WHERE t.AUDITORIUM_TYPENAME LIKE '%����������'
FOR XML AUTO, ROOT('������_���������'), elements;