USE UNIVER;

SELECT max(AUDITORIUM_CAPACITY) [������������� �����������],
	   min(AUDITORIUM_CAPACITY) [����������� �����������],
	   avg(AUDITORIUM_CAPACITY) [������� �����������],
	   sum(AUDITORIUM_CAPACITY) [��������� �����������],
	   count(AUDITORIUM_CAPACITY) [���������� ���������]
FROM AUDITORIUM