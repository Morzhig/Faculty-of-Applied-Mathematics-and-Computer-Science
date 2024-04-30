use Ucheb_6_Karpovich

/* 1 */
Select 
	MAX(PL) AS max_PL From Tabl_Kontinent$;

/* 2 */
Select 
	MIN(KolNas) AS min_KolNas From Tabl_Kontinent$
Where 
	Kontinent = 'Африка';

/* 3 */
Select 
	Sum(KolNas) AS sum_KolNas From Tabl_Kontinent$
Where
	Kontinent = 'Северная Америка' OR
	Kontinent = 'Южная Америка';

/* 4 */
Select 
	ROUND(AVG(Cast(KolNas as float)), 2) AS SR_KolNas 
	From 
		Tabl_Kontinent$
Where
	Kontinent != 'Европа';

/* 5 */
Select
	Count(*) AS Kol
From 
	Tabl_Kontinent$
Where 
	Left(Nazvanie, 1) = 'C';

/* 6 */
Select
	Count(Distinct Kontinent) AS Kol_Kontinent
From 
	Tabl_Kontinent$

/* 7 */
Select
	Max(KolNas) - Min(KolNas) AS Razn
From 
	Tabl_Kontinent$;

/* 8 */
Select
	Count(Distinct Kontinent) AS Kol_Kontinent
From 
	Tabl_Kontinent$

/* 9 */
Select 
	Kontinent, Count(Nazvanie) AS Kol_Stran
From 
	Tabl_Kontinent$
Group By 
	Kontinent
Order By 
	Kol_Stran Desc

/* 10 */
Select
	Left(Nazvanie, 1) AS PerV_BV, Count(Nazvanie) AS Kol_Stran
From 
	Tabl_Kontinent$
Group By 
	Left(Nazvanie, 1) 
Order By 
	PerV_BV

/* 11 */
Select
	Kontinent, AVG(CAST(KolNas as float)/PL) AS SR_Plotn
from 
	Tabl_Kontinent$
group by 
	Kontinent
having 
	avg(cast(KolNas as float) / PL) > 100

/* 12 */
select 
	Kontinent, case 
		when 
			Kontinent in ('Европа', 'Азия') then floor(sum(KolNas) * 1.2)

		when 
			Kontinent in ('Северная Америка', 'Африка') then floor(sum(KolNas) * 1.5)
		else 
			floor(sum(KolNas) * 1.7)
		end
	AS 
		SUm_Nas
	From 
		Tabl_Kontinent$
Group by 
	Kontinent

/* 13 */
Select
	Kontinent 
	from
		Tabl_Kontinent$
group by  
	Kontinent
having 
	MAX(KolNas) <= 1000 * min(KolNas)

/* 14 */
Select
	count(*) as KolNas
	from 
		Tabl_Kontinent$
group by
	Kontinent
having 
	max(KolNas) <= 1000 * min(KolNas)

/* 15 */
Select 
	Count(*) as KolNas
	From 
		Tabl_Kontinent$
Where
	Stolica is null

/* 16 */
Select
	max(len(Nazvanie)) as Дл_Название,
	max(len(Stolica)) as Дл_Столица,
	min(len(Nazvanie)) as Кр_Название,
	min(len(Stolica)) as Кр_Столица
	from
		Tabl_Kontinent$

/* 17 */
Select
	Kontinent, avg(cast(KolNas as float) / PL) as Plotn
	from 
		Tabl_Kontinent$
where 
	PL > 1000000
	group by
		Kontinent
having 
	avg(cast(KolNas as float) / PL) > 10
order by
	Plotn Desc