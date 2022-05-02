USE UNIVER
GO

SELECT AUDITORIUM [Наименование_аудитории],
	   AUDITORIUM_TYPENAME [Тип_аудитории],
	   AUDITORIUM_CAPACITY [Вместимость]
FROM AUDITORIUM as a
INNER JOIN AUDITORIUM_TYPE as t
on a.AUDITORIUM_TYPE = t.AUDITORIUM_TYPE
WHERE t.AUDITORIUM_TYPENAME LIKE '%Лекционная'
FOR XML AUTO, ROOT('Список_аудиторий'), elements;