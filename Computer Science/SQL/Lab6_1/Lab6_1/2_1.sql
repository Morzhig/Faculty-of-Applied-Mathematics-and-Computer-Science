use TestBD1

Create Table TestTable1
(
	iID int default 1,
	Constraint check_iID check (iID is not null)
)

insert into TestTable1
Values(10)