Create Database InternetStore
Go
Use InternetStore;
Create Table Klient_VK
(
	id int Primary Key Identity,
	age int Default 18,
	nname nvarchar(20) Not Null,
	fio nvarchar(20) Not Null,
	email varchar(30) UNIQUE,
	phone varchar(20) UNIQUE
);

Create Table Zakaz_VK
(
	id int Primary Key Identity,
	KlientId int,
	CreatedA Date,
	Foreign Key(KlientId) REFERENCES Klient_VK(ID) on delete cascade
)