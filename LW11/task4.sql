-- A --
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
--------------------- t1 ---------------------
SELECT @@SPID, 'INSERT PROGRESS' 'Результат', *
	FROM PROGRESS
	WHERE SUBJECT = 'БД';
SELECT @@SPID, 'UPDATE PROGRESS' 'Результат', 
		PROGRESS.SUBJECT [Предмет],
		PROGRESS.NOTE [Оценка]
	FROM PROGRESS
	WHERE SUBJECT = 'БД';

COMMIT;
--------------------- t2 ---------------------
-- B --
BEGIN TRANSACTION
SELECT @@SPID
INSERT PROGRESS VALUES ('БД', 1006, '2022-04-14', 2);
UPDATE PROGRESS
	SET SUBJECT = 'КГ'
	WHERE SUBJECT = 'БД';

--------------------- t1 ---------------------
--------------------- t2 ---------------------
ROLLBACK;