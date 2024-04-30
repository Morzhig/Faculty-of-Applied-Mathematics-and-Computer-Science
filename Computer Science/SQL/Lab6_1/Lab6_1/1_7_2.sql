use TestDatabas

If Object_ID('dbo.klient_alt', 'U') is not Null
Drop Table dbo.klient_alt;

Create Table Klient_alt
(
	id int Primary Key Identity,
	age int not null,
	nname nvarchar(20) not null,
	fio nvarchar(20) not null,
	email varchar(30) unique,
	phone varchar(20) unique
);

if Object_ID('dbo.Zakaz', 'U') is not null
Drop Table dbo.Zakaz;

Create Table Zakaz
(
	id int Identity,
	KlientId int,
	CreatedA date
);

Alter Table Zakaz
Add Foreign Key (KlientId) References Klient_alt(id);

Alter Table Zakaz
Add Primary Key(id);