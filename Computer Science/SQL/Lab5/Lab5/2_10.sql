use TestBD1

Create Table Klient_VKK
(
	id int Primary Key Identity,
	age int Default 18,
	nname nvarchar(20) Not Null,
	fio nvarchar(20) Not Null,
	email varchar(30) UNIQUE,
	phone varchar(20) UNIQUE
)

Create Table Zakaz_VKK
(
	id int Primary Key Identity,
	KlientId int REFERENCES Klient_VKK(ID),
	CreatedA Date
)