DECLARE @subj nvarchar(20), 
		@res nvarchar(300) = ''; 

DECLARE SubjectCurs CURSOR FOR 
	SELECT SUBJECT 
	FROM SUBJECT 
	WHERE SUBJECT.PULPIT = '����';

OPEN SubjectCurs;
	FETCH SubjectCurs INTO @subj;
	PRINT '������ ��������� �� ������� ����:';
	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @res = RTRIM(@subj) + ', ' + @res;
			FETCH SubjectCurs INTO @subj;
		END;
	PRINT @res;
CLOSE SubjectCurs;