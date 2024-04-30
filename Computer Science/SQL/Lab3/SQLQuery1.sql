use Ucheb_6_Karpovich

Select * FROM Products;

Select ProductName + ' (' + Manufacturer + ')' AS ModelName,
Price, Price * ProductCount AS TotalSum

From Products;