use TestDatabas

If Object_ID('dbo.klient_alt', 'U') is not Null
Drop Table dbo.klient_alt;

Create Table Klient_alt
(
	id int Primary Key,
	age int not null,
	nname nvarchar(20) not null,
	fio nvarchar(20) not null,
	email varchar(30) not null,
	phone varchar(20) not null
);

Alter Table Klient_alt
Add adress nvarchar(50) Not Null default 'нет';