-- A --
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
--------------------- t1 ---------------------
SELECT @@SPID, 'INSERT PROGRESS' '���������', *
	FROM PROGRESS
	WHERE SUBJECT = '��';
SELECT @@SPID, 'UPDATE PROGRESS' '���������', 
		PROGRESS.SUBJECT [�������],
		PROGRESS.NOTE [������]
	FROM PROGRESS
	WHERE SUBJECT = '��';

COMMIT;
--------------------- t2 ---------------------
-- B --
BEGIN TRANSACTION
SELECT @@SPID
INSERT PROGRESS VALUES ('��', 1006, '2022-04-14', 2);
UPDATE PROGRESS
	SET SUBJECT = '��'
	WHERE SUBJECT = '��';

--------------------- t1 ---------------------
--------------------- t2 ---------------------
ROLLBACK;