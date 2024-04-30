use TestBD1

Create Table TestTable5
(
	iID int default 1,
	Constraint check_iID2 Check(iID is not NULL),
	Constraint u_iID
		unique nonclustered(iID)
)