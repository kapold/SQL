USE GroupDB;
GO

CREATE TABLE Покупатели(
	Покупатель nvarchar(50) PRIMARY KEY,
	Телефон nvarchar(50) NULL,
	Адрес nvarchar(50) NULL,
) ON FG2;