DECLARE @averageMark float(8);
SET @averageMark = (SELECT avg(PROGRESS.NOTE)
					FROM PROGRESS)
PRINT @averageMark
IF(@averageMark >= 8) PRINT '�������� ������ ���������'
ELSE IF(@averageMark < 8 AND @averageMark >= 6) PRINT '�������� ������ ������'
ELSE IF(@averageMark >= 4 and @averageMark < 6) PRINT '�������� ������?'
ELSE PRINT '����� �� ������...'