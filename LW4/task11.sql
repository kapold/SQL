USE UNIVER;

DROP TABLE TIMETABLE;
CREATE TABLE TIMETABLE
(
	IDGROUP int FOREIGN KEY REFERENCES GROUPS(IDGROUP),
	AUDITORIUM char(20) FOREIGN KEY REFERENCES AUDITORIUM(AUDITORIUM),
	SUBJECT char(10) FOREIGN KEY REFERENCES SUBJECT(SUBJECT),
	TEACHER char(10) FOREIGN KEY REFERENCES TEACHER(TEACHER),
	WEEK_DAY char(10),
	COUPLE int
);

INSERT INTO TIMETABLE (IDGROUP, AUDITORIUM, SUBJECT, TEACHER, WEEK_DAY, COUPLE)
	VALUES (1, '301-1', '��', '�����', 'Monday', 1),
		   (2, '236-1', '��', '���', 'Monday', 1),
		   (2, '301-1', '��', '�����', 'Monday', 2),
		   (3, '313-1', '��', '���', 'Monday', 2),
		   (1, '236-1', '��', '���', 'Monday', 3),
		   (2, '301-1', '��', '�����', 'Monday', 3),
		   (2, '301-1', '��', '�����', 'Monday', 4),
		   (3, '313-1', '��', '���', 'Monday', 4),
		   (1, '301-1', '��', '�����', 'Thursday', 1),
		   (2, '236-1', '��', '���', 'Thursday', 1),
		   (2, '301-1', '��', '�����', 'Thursday', 2),
		   (3, '313-1', '��', '���', 'Thursday', 2),
		   (1, '236-1', '��', '���', 'Thursday', 3),
		   (2, '301-1', '��', '�����', 'Thursday', 3),
		   (2, '301-1', '��', '�����', 'Thursday', 4),
		   (3, '313-1', '��', '���', 'Thursday', 4);

-- ������� ��������� ��������� �� ������������ ����
SELECT AUDITORIUM.AUDITORIUM [��������� ���������]
FROM (SELECT TIMETABLE.AUDITORIUM 
	  FROM TIMETABLE
	  WHERE TIMETABLE.COUPLE = 2) 
AS T1 RIGHT OUTER JOIN AUDITORIUM
ON T1.AUDITORIUM = AUDITORIUM.AUDITORIUM
WHERE T1.AUDITORIUM IS NULL;

-- ������� ��������� ��������� �� ������������ ���� ������
SELECT AUDITORIUM.AUDITORIUM [��������� ���������]
FROM (SELECT TIMETABLE.AUDITORIUM 
	  FROM TIMETABLE
	  WHERE TIMETABLE.WEEK_DAY = 'Monday') 
AS T1 RIGHT OUTER JOIN AUDITORIUM
ON T1.AUDITORIUM = AUDITORIUM.AUDITORIUM
WHERE T1.AUDITORIUM IS NULL;

-- ������� ����� � �������������� � � �������
DECLARE @teacher char(10), 
		@week_day char(10);
SET @teacher = '���';
SET @week_day = 'Monday';

SELECT @teacher [�������������], @week_day [���� ������], T1.COUPLE [���� � �����]
	FROM (SELECT DISTINCT TIMETABLE.COUPLE
			FROM TIMETABLE
				WHERE TIMETABLE.COUPLE 
				between 
					(SELECT min(TIMETABLE.COUPLE)
						FROM TIMETABLE
							WHERE TIMETABLE.TEACHER = @teacher and TIMETABLE.WEEK_DAY = @week_day) 
				and 
					(SELECT max(TIMETABLE.COUPLE)
						FROM TIMETABLE
							WHERE TIMETABLE.TEACHER = @teacher and TIMETABLE.WEEK_DAY = @week_day)) as T1 
		left outer join 
		(SELECT TIMETABLE.COUPLE
			FROM TIMETABLE
				WHERE TIMETABLE.TEACHER = @teacher and TIMETABLE.WEEK_DAY = @week_day) as T2
		ON T1.COUPLE = T2.COUPLE
		 WHERE T2.COUPLE is null


DECLARE @idgroup integer;
SET @idgroup = 1;

SELECT @idgroup [������], T1.WEEK_DAY [���� ������], T1.COUPLE [���� � �����]
	FROM (SELECT DISTINCT TIMETABLE.WEEK_DAY, TIMETABLE.COUPLE
			FROM TIMETABLE
				WHERE TIMETABLE.COUPLE 
				between 
					(SELECT min(TIMETABLE.COUPLE )
						FROM TIMETABLE
							WHERE TIMETABLE.IDGROUP = @idgroup) 
				and 
					(SELECT max(TIMETABLE.COUPLE )
						FROM TIMETABLE
							WHERE TIMETABLE.IDGROUP = @idgroup )) as T1 
		left outer join 
		(SELECT TIMETABLE.COUPLE
			FROM TIMETABLE
				WHERE TIMETABLE.IDGROUP = @idgroup) as T2
		ON T1.COUPLE = T2.COUPLE
		 WHERE T2.COUPLE is null