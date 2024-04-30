CREATE DATABASE TestDatabas
ON
(
	NAME = TestDatabas_data,
	FILENAME = "D:\Programming\SQL\Lab5\test.mdf",
	SIZE = 10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
)
LOG ON
( 
	NAME = 'TestDatabas_log',
	FILENAME = 'D:\Programming\SQL\Lab5\test.ldf',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5%
)