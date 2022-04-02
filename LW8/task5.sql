DECLARE @averageMark float(8);
SET @averageMark = (SELECT avg(PROGRESS.NOTE)
					FROM PROGRESS)
PRINT @averageMark
IF(@averageMark >= 8) PRINT 'Студенты учатся прекрасно'
ELSE IF(@averageMark < 8 AND @averageMark >= 6) PRINT 'Студенты учатся хорошо'
ELSE IF(@averageMark >= 4 and @averageMark < 6) PRINT 'Студенты учатся?'
ELSE PRINT 'Никто не учится...'