CREATE VIEW [Преподаватель] AS
	SELECT TEACHER.TEACHER [Код],
		   TEACHER.TEACHER_NAME [Имя преподователя],
		   TEACHER.GENDER [Пол],
		   TEACHER.PULPIT [Код кафедры]
	FROM TEACHER;