DECLARE @c char(10) = 'charType',
		@vc varchar(20) = 'varCharType',
		@dt datetime,
		@t time,
		@i int,
		@si smallint,
		@ti tinyint,
		@num numeric;

SET @dt = '2004-05-23T14:25:10';
SET	@t = '01:00:00';

SELECT @i = 10;
SELECT @si = 11;
SET @ti = 12;
SELECT @num = 22.22;

SELECT @c AS char,
	   @vc AS varchar,
	   @dt AS datetime,
	   @t AS time;

PRINT 'INT: ' + convert(varchar, @i);
PRINT 'SMALLINT: ' + convert(varchar, @si);
PRINT 'TINYINT: ' + convert(varchar, @ti);
PRINT 'NUMERIC: ' + convert(varchar, @num);