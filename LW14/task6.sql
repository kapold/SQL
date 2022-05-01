CREATE TRIGGER TR_TEACHER_DEL1 on TEACHER after DELETE AS
	BEGIN
		PRINT 'TR_TEACHER_DEL_1';
		RETURN;
	END
GO

CREATE TRIGGER TR_TEACHER_DEL2 on TEACHER after DELETE AS
	BEGIN
		PRINT 'TR_TEACHER_DEL_2';
		RETURN;
	END
GO

CREATE TRIGGER TR_TEACHER_DEL3 on TEACHER after DELETE AS
	BEGIN
		PRINT 'TR_TEACHER_DEL_3';
		RETURN;
	END
GO

select t.name, e.type_desc 
from sys.triggers  t join  sys.trigger_events e  
on t.object_id = e.object_id  
where e.type_desc = 'DELETE';

EXEC SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL3', 
	                     @order = 'First', @stmttype = 'DELETE';

EXEC SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL1', 
	                     @order = 'Last', @stmttype = 'DELETE';
