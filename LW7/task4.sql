CREATE VIEW [Лекционные_аудитории] (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE) AS
	SELECT AUDITORIUM.AUDITORIUM [Код],
		   AUDITORIUM.AUDITORIUM_NAME [Наименование аудитории],
		   AUDITORIUM.AUDITORIUM_CAPACITY [Вместимость],
		   AUDITORIUM.AUDITORIUM_TYPE [Тип аудитории]
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE = 'ЛК' WITH CHECK OPTION;
GO

SELECT * FROM [Лекционные_аудитории];

INSERT [Лекционные_аудитории] VALUES ('900-1', '900-1', 20, 'ЛК')
SELECT * FROM [Лекционные_аудитории];

UPDATE [Лекционные_аудитории] SET AUDITORIUM = '901-1' WHERE AUDITORIUM_NAME = '900-1'
SELECT * FROM [Лекционные_аудитории];

--DROP VIEW [Лекционные_аудитории];