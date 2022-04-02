USE A_MyBase;

SELECT * FROM Сделки
WHERE Дата_сделки BETWEEN '2022-02-19T00:00:00' AND '2022-02-21T00:00:00';

SELECT * FROM Покупатели
WHERE Покупатель LIKE 'i%';

SELECT * FROM Товары
WHERE Количество_на_складе In (11, 20);