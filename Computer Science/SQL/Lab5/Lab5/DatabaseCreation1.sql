CREATE DATABASE TestDatabas1
ON
(
	NAME = TestDatabas1_data,
	FILENAME = "D:\Programming\SQL\Lab5\test1.mdf"
)
LOG ON
( 
	NAME = 'TestDatabas1_log',
	FILENAME = 'D:\Programming\SQL\Lab5\test1.ldf',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5%
)