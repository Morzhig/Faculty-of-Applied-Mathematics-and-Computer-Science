use TestBD1

Create Table TestTable4
(
	id int default 1 not null,
	vcName varchar(50) not null,
	dBirthDate datetime,
	dDocDate datetime,
	Constraint CK_Dbirthdate
	Check (dBirthDate < dDocDate AND dBirthDate<getdate())
)