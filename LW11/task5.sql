-- A --
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
SELECT count(*) FROM PROGRESS WHERE SUBJECT = '��';
---------------------- t1 ----------------------
---------------------- t2 ----------------------
SELECT 'UPDATE PROGRESS' '���������', count(*)
	FROM PROGRESS WHERE SUBJECT = '��';

COMMIT;

-- B --
BEGIN TRANSACTION
---------------------- t1 ----------------------
UPDATE PROGRESS SET SUBJECT = '��'
	WHERE SUBJECT = '��';

COMMIT;
---------------------- t2 ----------------------