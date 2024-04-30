--������������� ��
use Ucheb_6_Karpovich

Select * FROM Products;

--������� ��������� �������������� ��������
Select ProductName + ' (' + Manufacturer + ')', Price, Price * ProductCount

From Products;

--���������� ��������� ������� ����� AS
Select ProductName + ' (' + Manufacturer + ')' AS ModelName,
Price, Price * ProductCount AS TotalSum

From Products;

--������� � �����������
Select ProductName + ' (' + Manufacturer + ')' AS ModelName,
Price INTO ProductSummary
From Products

Select * From ProductSummary

--���������� �� ������� ProductName �� �����������
Select *
From Products
ORDER BY ProductName

--���������� �� ������� ProductName �� ��������
Select *
From Products
ORDER BY ProductName DESC

--���������� �� �������� ProductName. Manufacturer
Select *
From Products
ORDER BY Manufacturer, ProductName

--����������
Select ProductName, Price * ProductCount AS TotalSum
From Products
ORDER BY TotalSum

--���������� �� ������ ��������
Select ProductName, Price, ProductCount
From Products
ORDER BY ProductCount * Price


