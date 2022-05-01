CREATE TRIGGER DDL_UNIVER on DATABASE for DDL_DATABASE_LEVEL_EVENTS AS   
	DECLARE @t varchar(50) = EVENTDATA().value('(/EVENT_INS-TANCE/EventType)[1]', 'varchar(50)');
	DECLARE @t1 varchar(50) = EVENTDATA().value('(/EVENT_INS-TANCE/ObjectName)[1]', 'varchar(50)');
	DECLARE @t2 varchar(50) = EVENTDATA().value('(/EVENT_INS-TANCE/ObjectType)[1]', 'varchar(50)'); 
	IF @t1 = 'TEACHER' 
	BEGIN
       PRINT '��� �������: '+ @t;
       PRINT '��� �������: '+ @t1;
       PRINT '��� �������: '+ @t2;
       RAISERROR( N'�������� � �������� TEACHER ���������', 16, 1);  
       ROLLBACK;    
	END;
GO

ALTER TABLE TEACHER DROP COLUMN PULPIT;