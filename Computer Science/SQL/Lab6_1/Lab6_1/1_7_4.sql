use TestDatabas;

Alter Table dbo.Zakaz
ADD Constraint PK_Zakaz_id Primary Key(id);

Alter Table dbo.Zakaz
Add Constraint FK_Zakaz_TO_Klient_Alt
Foreign Key(KlientId) References Klient_alt(id);

Alter Table dbo.Klient_Alt
Add Constraint CK_Klient_alt_Age2 Check(Age > 0);