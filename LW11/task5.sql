-- A --
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
SELECT count(*) FROM PROGRESS WHERE SUBJECT = 'БД';
---------------------- t1 ----------------------
---------------------- t2 ----------------------
SELECT 'UPDATE PROGRESS' 'Результат', count(*)
	FROM PROGRESS WHERE SUBJECT = 'БД';

COMMIT;

-- B --
BEGIN TRANSACTION
---------------------- t1 ----------------------
UPDATE PROGRESS SET SUBJECT = 'КГ'
	WHERE SUBJECT = 'БД';

COMMIT;
---------------------- t2 ----------------------