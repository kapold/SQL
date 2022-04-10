-- удаляются строки, содержащие информацию о студентах, получивших оценки ниже 4 
DECLARE Task1 CURSOR LOCAL DYNAMIC FOR
	SELECT s.NAME [Студент],
		   p.NOTE [Оценка]
	FROM PROGRESS AS p
		INNER JOIN STUDENT AS s
		ON p.IDSTUDENT = s.IDSTUDENT
		INNER JOIN GROUPS AS g
		ON s.IDGROUP = g.IDGROUP
	WHERE p.NOTE <= 4;

DECLARE @name nvarchar(50),
		@note int;

OPEN Task1;
	FETCH Task1 INTO @name, @note;
	DELETE PROGRESS WHERE CURRENT OF Task1;
CLOSE Task1;
GO;

-- для студента с конкретным номером IDSTUDENT корректируется оценка
DECLARE Task2 CURSOR LOCAL DYNAMIC FOR
	SELECT s.NAME [Студент],
		   p.NOTE [Оценка]
	FROM PROGRESS AS p
		INNER JOIN STUDENT AS s
		ON p.IDSTUDENT = s.IDSTUDENT
		INNER JOIN GROUPS AS g
		ON s.IDGROUP = g.IDGROUP
	WHERE s.IDSTUDENT = 1002;

DECLARE @name nvarchar(50),
		@note int;

OPEN Task2;
	FETCH Task2 INTO @name, @note;
	UPDATE PROGRESS SET NOTE = NOTE - 1 
		WHERE CURRENT OF Task2;
CLOSE Task2;