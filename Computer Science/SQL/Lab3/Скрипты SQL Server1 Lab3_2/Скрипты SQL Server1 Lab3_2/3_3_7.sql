use Ucheb_6_Karpovich

SELECT *
From Products

Where 
	ProductCount > 2 AND Price > 30000
	OR 
	Manufacturer = 'Samsung';