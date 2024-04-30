use TestBD1
Create Table Klient_PR_K_ID_UN
(
	id int Primary Key Identity,
	age int,
	nname nvarchar(20),
	fio nvarchar(20),
	email varchar(30) UNIQUE,
	phone varchar(20) UNIQUE
)

Create Table Klient_PR_K_ID_UN1
(
	id int Primary Key Identity,
	age int,
	nname nvarchar(20),
	fio nvarchar(20),
	email varchar(30),
	phone varchar(20),
	UNIQUE(Email, Phone)
)