use TestDatabas

Alter Table dbo.Klient_alt with nocheck
	ADD CHECK (Age > 21);