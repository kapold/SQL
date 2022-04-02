USE A_MyBase;

CREATE TABLE Покупатели
(
	Покупатель NVARCHAR(50) primary key,
	Телефон NVARCHAR(50),
	Адрес NVARCHAR(50)
);

CREATE TABLE Товары
(
	Наименование_товара NVARCHAR(50) primary key,
	Цена REAL check(Цена>0) not null,
	Описание NVARCHAR(50),
	Количество_на_складе INT check(Количество_на_складе>0)
);

CREATE TABLE Сделки
(
	ID_сделки INT primary key,
	Покупатель NVARCHAR(50) foreign key references Покупатели(Покупатель),
	Дата_сделки SMALLDATETIME,
	Количество_заказанного_товара INT,
	Наименование_товара NVARCHAR(50) foreign key references Товары(Наименование_товара)
);