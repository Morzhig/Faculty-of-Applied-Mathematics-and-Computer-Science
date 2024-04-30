use Ucheb_6_Karpovich

CREATE TABLE dbo.test_table
(
 id INT IDENTITY(1,1) NOT NULL,
 manager VARCHAR(50) NULL,
 otdel VARCHAR(50) NULL,
 god INT NULL,
 summa MONEY NULL
) 