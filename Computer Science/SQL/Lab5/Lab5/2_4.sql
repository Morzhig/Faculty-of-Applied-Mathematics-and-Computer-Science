use TestBD1
Create Table Klient_PR_K_ID
(
	id int Primary Key Identity,
	age int,
	nname nvarchar(20),
	fio nvarchar(20),
	email varchar(30),
	phone varchar(20)
)