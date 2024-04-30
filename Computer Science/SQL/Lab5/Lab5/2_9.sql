use TestBD1
Create Table Klient_im_ogr
(
	id int Constraint PK_Klient_Id Primary Key Identity,
	age int Constraint DF_Klient_Age Default 18
	Constraint Ck_Klient_Age Check(age > 0 AND age < 100),
	nname nvarchar(20) Not Null,
	fio nvarchar(20) Not Null,
	email varchar(30) Constraint Uq_Klient_Email UNIQUE,
	phone varchar(20) Constraint Ug_Klient_Phone UNIQUE
)

Create Table Klient_im_ogr1
(
	id int Identity,
	age int Constraint DF_Klient_Age1 Default 18,
	nname nvarchar(20) Not Null,
	fio nvarchar(20) Not Null,
	email varchar(30),
	phone varchar(20),

	Constraint Ck_Klient_Age1 Check(age > 0 AND age < 100),
	Constraint PK_Klient_Id1 Primary Key(id),
	Constraint Uq_Klient_Email1 UNIQUE(email),
	Constraint Uq_Klient_Phone1 UNIQUE(phone)
)