PRINT '����� ������������ �����: ' + cast(@@ROWCOUNT as varchar)
PRINT '������ SQL Server: ' + @@VERSION
PRINT '��������� ������������� ��������, ����������� �������� �������� �����������: ' + cast(@@SPID as varchar)
PRINT '��� ��������� ������: ' + cast(@@ERROR as varchar)
PRINT '��� �������: ' + cast(@@SERVERNAME as varchar)
PRINT '������� ����������� ����������: ' + cast(@@TRANCOUNT as varchar)
PRINT '�������� ���������� ���������� ����� ��������������� ������: ' + cast(@@FETCH_STATUS as varchar)
PRINT '������� ����������� ������� ���-������: ' + cast(@@NESTLEVEL as varchar)