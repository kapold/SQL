USE A_MyBase;

ALTER TABLE ������ ADD ����_����������� SMALLDATETIME;
ALTER TABLE ������ ADD CONSTRAINT CHk_positive check(����������_�����������_������>0);
ALTER TABLE ������ DROP COLUMN ����_�����������;