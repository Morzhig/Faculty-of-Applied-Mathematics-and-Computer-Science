--==========================================================================
-- Add column template
--
-- This template creates a table, then it adds a new column to the table.
--==========================================================================
USE TestDatabas

ALTER TABLE dbo.Klient_alt
	ADD Phone varchar(20) not NULL