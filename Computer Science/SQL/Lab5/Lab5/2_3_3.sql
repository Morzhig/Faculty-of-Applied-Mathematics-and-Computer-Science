use TestBD1
Create Table Zakaz_L
(
	zakaz int,
	produkt int,
	kol_vo int,
	cena money,
	Primary Key(Zakaz, Produkt)
)