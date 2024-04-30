Create Table Klient_PR_K_ID_UN_Def_CH
(
	id int Primary Key Identity,
	age int Default 18 Check(Age>0 And Age<100),
	nname nvarchar(20) Not Null,
	fio nvarchar(20) Not Null,
	email varchar(30) UNIQUE Check (email!=''),
	phone varchar(20) UNIQUE Check (phone!='')
)