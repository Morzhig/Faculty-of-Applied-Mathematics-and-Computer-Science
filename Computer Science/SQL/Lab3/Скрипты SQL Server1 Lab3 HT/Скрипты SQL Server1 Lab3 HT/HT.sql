--присоединение БД
use AdventureWorksDW2019

Select * From FactCallCenter;

--Определяем псевдоним столбца через AS
Select CAST(FactCallCenterID as nvarchar) + ' (' + CAST(DateKey as nvarchar) + ')' AS Name,
Calls, CAST(Orders as decimal) / Cast(Calls as decimal) AS "Orders Calls Ratio"

From FactCallCenter;

--Выборка с добавлением
Select CAST(FactCallCenterID as nvarchar) + ' (' + CAST(DateKey as nvarchar) + ')' AS Name,
Calls INTO CallsSummary
From FactCallCenter

Select * From CallsSummary

--Сортировка
Select FactCallCenterID,  Calls, CAST(Orders as decimal) / Cast(Calls as decimal) AS "Orders Calls Ratio"
From FactCallCenter
ORDER BY "Orders Calls Ratio"

--Сортировка на основе столбцов
Select FactCallCenterID, Orders, Calls
From FactCallCenter
ORDER BY CAST(Orders as decimal) / Cast(Calls as decimal)