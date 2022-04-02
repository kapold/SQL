USE A_MyBase;

ALTER TABLE Товары ADD Дата_поступления SMALLDATETIME;
ALTER TABLE Сделки ADD CONSTRAINT CHk_positive check(Количество_заказанного_товара>0);
ALTER TABLE Товары DROP COLUMN Дата_поступления;