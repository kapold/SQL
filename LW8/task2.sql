DECLARE @count int = (SELECT sum(AUDITORIUM.AUDITORIUM_CAPACITY) FROM AUDITORIUM);

IF(@count < 200) 
PRINT '����� �����������: ' + cast(@count as varchar);
ELSE
	BEGIN
		DECLARE @auditCount int,
				@averageCapacity float(4),
				@averAuditCount int;
		SET @auditCount = (SELECT count(AUDITORIUM.AUDITORIUM) 
						   FROM AUDITORIUM);
		SET @averageCapacity = (SELECT cast(avg(AUDITORIUM.AUDITORIUM_CAPACITY) as float(4)) 
								FROM AUDITORIUM);
		SET @averAuditCount = (SELECT count(AUDITORIUM.AUDITORIUM)
							   FROM AUDITORIUM
							   WHERE AUDITORIUM.AUDITORIUM_CAPACITY < @averageCapacity);
		PRINT '���������� ���������: ' + cast(@auditCount as varchar);
		PRINT '������� �����������: ' + cast(@averageCapacity as varchar);
		PRINT '���������� ���������, ����������� ������� ������ �������: ' + cast(@averAuditCount as varchar);
		PRINT '������� ����� ���������: ' + cast(cast(@auditCount/@averAuditCount as float(8)) as varchar);
	END