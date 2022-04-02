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
	VALUES (1, '301-1', 'БД', 'БРКВЧ', 'Monday', 1),
		   (2, '236-1', 'КГ', 'ДТК', 'Monday', 1),
		   (2, '301-1', 'БД', 'БРКВЧ', 'Monday', 2),
		   (3, '313-1', 'ДМ', 'МРЗ', 'Monday', 2),
		   (1, '236-1', 'КГ', 'ДТК', 'Monday', 3),
		   (2, '301-1', 'БД', 'БРКВЧ', 'Monday', 3),
		   (2, '301-1', 'БД', 'БРКВЧ', 'Monday', 4),
		   (3, '313-1', 'ДМ', 'МРЗ', 'Monday', 4),
		   (1, '301-1', 'БД', 'БРКВЧ', 'Thursday', 1),
		   (2, '236-1', 'КГ', 'ДТК', 'Thursday', 1),
		   (2, '301-1', 'БД', 'БРКВЧ', 'Thursday', 2),
		   (3, '313-1', 'ДМ', 'МРЗ', 'Thursday', 2),
		   (1, '236-1', 'КГ', 'ДТК', 'Thursday', 3),
		   (2, '301-1', 'БД', 'БРКВЧ', 'Thursday', 3),
		   (2, '301-1', 'БД', 'БРКВЧ', 'Thursday', 4),
		   (3, '313-1', 'ДМ', 'МРЗ', 'Thursday', 4);

-- Наличие свободных аудиторий на определенную пару
SELECT AUDITORIUM.AUDITORIUM [Свободные аудитории]
FROM (SELECT TIMETABLE.AUDITORIUM 
	  FROM TIMETABLE
	  WHERE TIMETABLE.COUPLE = 2) 
AS T1 RIGHT OUTER JOIN AUDITORIUM
ON T1.AUDITORIUM = AUDITORIUM.AUDITORIUM
WHERE T1.AUDITORIUM IS NULL;

-- Наличие свободных аудиторий на определенный день недели
SELECT AUDITORIUM.AUDITORIUM [Свободные аудитории]
FROM (SELECT TIMETABLE.AUDITORIUM 
	  FROM TIMETABLE
	  WHERE TIMETABLE.WEEK_DAY = 'Monday') 
AS T1 RIGHT OUTER JOIN AUDITORIUM
ON T1.AUDITORIUM = AUDITORIUM.AUDITORIUM
WHERE T1.AUDITORIUM IS NULL;

-- Наличие «окон» у преподавателей и в группах
DECLARE @teacher char(10), 
		@week_day char(10);
SET @teacher = 'ДТК';
SET @week_day = 'Monday';

SELECT @teacher [Преподаватель], @week_day [День недели], T1.COUPLE [Пара с Окном]
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

SELECT @idgroup [Группа], T1.WEEK_DAY [День недели], T1.COUPLE [Пара с Окном]
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