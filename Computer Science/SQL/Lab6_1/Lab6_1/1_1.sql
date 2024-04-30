use TestDatabas

If Object_ID('dbo.klient_alt', 'U') is not Null
Drop Table dbo.klient_alt;

Create Table Klient_alt
(
	id int Primary Key,
	age int,
	nname nvarchar(20),
	fio nvarchar(20),
	email varchar(30),
	phone varchar(20)
);