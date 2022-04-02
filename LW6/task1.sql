USE UNIVER;

SELECT max(AUDITORIUM_CAPACITY) [Максимальнеая вместимость],
	   min(AUDITORIUM_CAPACITY) [Минимальная вместимость],
	   avg(AUDITORIUM_CAPACITY) [Средняя вместимость],
	   sum(AUDITORIUM_CAPACITY) [Суммарная вместимость],
	   count(AUDITORIUM_CAPACITY) [Количество аудиторий]
FROM AUDITORIUM