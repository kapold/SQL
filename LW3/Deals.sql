USE A_MyBase;

CREATE TABLE ����������
(
	���������� NVARCHAR(50) primary key,
	������� NVARCHAR(50),
	����� NVARCHAR(50)
);

CREATE TABLE ������
(
	������������_������ NVARCHAR(50) primary key,
	���� REAL check(����>0) not null,
	�������� NVARCHAR(50),
	����������_��_������ INT check(����������_��_������>0)
);

CREATE TABLE ������
(
	ID_������ INT primary key,
	���������� NVARCHAR(50) foreign key references ����������(����������),
	����_������ SMALLDATETIME,
	����������_�����������_������ INT,
	������������_������ NVARCHAR(50) foreign key references ������(������������_������)
);