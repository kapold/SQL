-- ��������� �������� ���������� Z
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

-- �������������� ������� ��� �������� � ����������� 
-- (��������, �������� ������� ���������� � �������� �. �.)
DECLARE @name nvarchar(50) = '�������� ����� ����������';
		SET @name = replace(@name, '�����', '�.');
		SET @name = replace(@name, '����������', '�.');
PRINT @name

-- ����� ���������, � ������� ���� �������� � ��������� ������, � ����������� �� ��������;
DECLARE @currentDate date;
SET @currentDate = getdate();
SET @currentDate = dateadd(month, 1, @currentDate);

SELECT STUDENT.NAME AS '��� ��������',
	   DATEDIFF(year, STUDENT.BDAY, @currentDate) AS '�������'
FROM STUDENT
WHERE FORMAT(STUDENT.BDAY, 'MM') = FORMAT(@currentDate, 'MM');

-- ����� ��� ������, � ������� �������� ��������� ������ ������� ������� �� ����.
DECLARE @groupNumber int,
		@day date;
SET @groupNumber = 1;

SET @day = (SELECT DISTINCT PROGRESS.PDATE
			FROM PROGRESS
			INNER JOIN STUDENT
			ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			AND PROGRESS.SUBJECT = '����'
			INNER JOIN GROUPS
			ON GROUPS.IDGROUP = @groupNumber)
PRINT @day