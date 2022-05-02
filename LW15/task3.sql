USE UNIVER
GO

DECLARE @h int = 0,
		@x nvarchar(3000) = '<?xml version="1.0" ?>
				<дисциплины>
					<дисциплина код="КГиГ" название="Компьютерная геометрия и графика" кафедра="ИСиТ" />
					<дисциплина код="ОЗИ" название="Основы защиты информации" кафедра="ИСиТ" />
					<дисциплина код="МПп" название="Математическое программирование" кафедра="ИСиТ" />
				</дисциплины>';

EXEC sp_xml_preparedocument @h output, @x; -- подготовка документа
SELECT * FROM openxml(@h,'/дисциплины/дисциплина',0)
	WITH([код] char(10), [название] varchar(100), [кафедра] char(20))
EXEC sp_xml_removedocument @h;             -- удаление документа

INSERT SUBJECT SELECT [код], [название], [кафедра] FROM OPENXML(@h, '/дисциплины/дисциплина',0)
    WITH([код] char(10), [название] varchar(100), [кафедра] char(20));

DELETE FROM SUBJECT WHERE SUBJECT.SUBJECT='КГиГ' or SUBJECT.SUBJECT='ОЗИ' or SUBJECT.SUBJECT='МПп'