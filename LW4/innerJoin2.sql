USE UNIVER;

SELECT AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
FROM AUDITORIUM_TYPE 
INNER JOIN AUDITORIUM
ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
AND AUDITORIUM_TYPE.AUDITORIUM_TYPENAME LIKE '%���������%';