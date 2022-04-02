-- Вычислить значение переменной Z
DECLARE @t int = 3,
		@x int = 2,
		@z float(8);

IF(@t > @x)
	BEGIN
		SET @z = power(sin(@t), 2)
	END

ELSE IF(@t < @x)
	BEGIN
		SET @z = 4 * (@t + @x)
	END

ELSE IF(@t = @x)
	BEGIN
		SET @z = 1 - exp(@x - 2)
	END

PRINT @z

-- Преобразование полного ФИО студента в сокращенное 
-- (например, Макейчик Татьяна Леонидовна в Макейчик Т. Л.)
DECLARE @name nvarchar(50) = 'Адамович Антон Максимович';
		SET @name = replace(@name, 'Антон', 'А.');
		SET @name = replace(@name, 'Максимович', 'М.');
PRINT @name

-- Поиск студентов, у которых день рождения в следующем месяце, и определение их возраста;
DECLARE @currentDate date;
SET @currentDate = getdate();
SET @currentDate = dateadd(month, 1, @currentDate);

SELECT STUDENT.NAME AS 'Имя студента',
	   DATEDIFF(year, STUDENT.BDAY, @currentDate) AS 'Возраст'
FROM STUDENT
WHERE FORMAT(STUDENT.BDAY, 'MM') = FORMAT(@currentDate, 'MM');

-- Поиск дня недели, в который студенты некоторой группы сдавали экзамен по СУБД.
DECLARE @groupNumber int,
		@day date;
SET @groupNumber = 1;

SET @day = (SELECT DISTINCT PROGRESS.PDATE
			FROM PROGRESS
			INNER JOIN STUDENT
			ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			AND PROGRESS.SUBJECT = 'СУБД'
			INNER JOIN GROUPS
			ON GROUPS.IDGROUP = @groupNumber)
PRINT @day