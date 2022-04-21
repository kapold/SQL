-- A --
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
SELECT IDSTUDENT FROM PROGRESS
	WHERE SUBJECT = '��';

---------------------- t1 ----------------------
---------------------- t2 ----------------------
SELECT CASE
	WHEN IDSTUDENT = 1018 THEN 'INSERT PROGRESS' ELSE ''
	END '���������', IDSTUDENT FROM PROGRESS
		WHERE SUBJECT = '��';

COMMIT;

-- B --
BEGIN TRANSACTION
---------------------- t1 ----------------------
INSERT PROGRESS VALUES ('��', 1018, '2022-04-15', 7);
COMMIT;
---------------------- t2 ----------------------