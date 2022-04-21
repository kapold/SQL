ALTER PROCEDURE PSUBJECT @p varchar(20) AS
	BEGIN
		DECLARE @k int = (SELECT count(*) FROM SUBJECT);
		SELECT * FROM SUBJECT WHERE PULPIT = @p;
	END;
GO

CREATE TABLE #SUBJECT
(
	SubjectNumber nvarchar(50) primary key,
	SubjectName nvarchar(50) NOT NULL,
	Pulpit nvarchar(50) NOT NULL
);

INSERT #SUBJECT EXEC PSUBJECT @p = 'ศั่า';
INSERT #SUBJECT EXEC PSUBJECT @p = 'าห';

SELECT * FROM #SUBJECT;