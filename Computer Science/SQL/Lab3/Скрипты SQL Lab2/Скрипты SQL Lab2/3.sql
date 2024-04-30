--присоединение БД
use Ucheb_6_Karpovich

Select * FROM Products;

--Столбец результат арифметической операции
Select ProductName + ' (' + Manufacturer + ')', Price, Price * ProductCount

From Products;

--Определяем псевдоним столбца через AS
Select ProductName + ' (' + Manufacturer + ')' AS ModelName,
Price, Price * ProductCount AS TotalSum

From Products;

--Выборка с добавлением
Select ProductName + ' (' + Manufacturer + ')' AS ModelName,
Price INTO ProductSummary
From Products

Select * From ProductSummary

--Сортировка по столбцу ProductName по возрастанию
Select *
From Products
ORDER BY ProductName

--Сортировка по столбцу ProductName по убыванию
Select *
From Products
ORDER BY ProductName DESC

--Сортировка по столбцам ProductName. Manufacturer
Select *
From Products
ORDER BY Manufacturer, ProductName

--Сортировка
Select ProductName, Price * ProductCount AS TotalSum
From Products
ORDER BY TotalSum

--Сортировка на основе столбцов
Select ProductName, Price, ProductCount
From Products
ORDER BY ProductCount * Price


