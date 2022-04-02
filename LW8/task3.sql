PRINT 'Число обработанных строк: ' + cast(@@ROWCOUNT as varchar)
PRINT 'Версия SQL Server: ' + @@VERSION
PRINT 'Системный идентификатор процесса, назначенный сервером текущему подключению: ' + cast(@@SPID as varchar)
PRINT 'Код последней ошибки: ' + cast(@@ERROR as varchar)
PRINT 'Имя сервера: ' + cast(@@SERVERNAME as varchar)
PRINT 'Уровень вложенности транзакции: ' + cast(@@TRANCOUNT as varchar)
PRINT 'Проверка результата считывания строк результирующего набора: ' + cast(@@FETCH_STATUS as varchar)
PRINT 'Уровень вложенности текущей про-цедуры: ' + cast(@@NESTLEVEL as varchar)