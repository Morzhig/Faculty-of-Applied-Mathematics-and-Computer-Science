use TestBD1

Create Table TestTable2
(
	id int default 1 not null,
	vcName varchar(50) not null,
	dBirthDate datetime,
	Constraint CK_birthdate
	Check (dBirthDate > '01-01-1900' AND dBirthDate<getdate())
)