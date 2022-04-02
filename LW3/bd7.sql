USE master;
GO

CREATE DATABASE GroupDB ON PRIMARY
(name = 'MyBase_mdf', filename = N'D:\BD\MyBase_mdf.mdf',
size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1020Kb),
filegroup FG2
(name = 'MyBase_lfg1', filename = N'D:\BD\MyBase_fg1.ndf',
size = 10240Kb, maxsize = 2Gb, filegrowth = 10%)
log on
(name = 'MyBase_log', filename = N'D:\BD\MyBase_log.ldf',
size = 10240Kb, maxsize = 2Gb, filegrowth = 10%);