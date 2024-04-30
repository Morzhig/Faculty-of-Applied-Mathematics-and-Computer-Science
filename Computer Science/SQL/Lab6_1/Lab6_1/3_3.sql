use Ucheb_6_Karpovich

/* 17 ������� */
Select 
	min(PL) AS min_PL From Tabl_Kontinent$;

/* 18 ������� */
Select 
	max(KolNas) AS max_KolNas From Tabl_Kontinent$
Where 
	Kontinent = '�������� �������' OR
	Kontinent = '����� �������';

/* 19 ������� */
Select 
	ROUND(AVG(Cast(KolNas as float)), 1) AS SR_KolNas 
	From 
		Tabl_Kontinent$

/* 20 ������� */
Select
	Count(*) AS Kol
From 
	Tabl_Kontinent$
Where 
	(right(Nazvanie, 2) = '��') AND (right(Nazvanie, 4) != '����');

/* 21 ������� */
Select
	Count(Kontinent) AS Kol
From
	Tabl_Kontinent$
Where 
	Left(Nazvanie, 1) = '�';

/* 22 ������� */
Select
	max(PL) / min(PL) AS Kol_Raz
From 
	Tabl_Kontinent$

/* 23 ������� */
Select
	Kontinent, Count(Nazvanie) as Kol_Stran
From 
	Tabl_Kontinent$
group by
	Kontinent
	having
		sum(KolNas) > 100000000
order by
	Kol_Stran

/* 24 ������� */
Select
	Count(Nazvanie) as Kol_Stran, len(Nazvanie) as Length
From 
	Tabl_Kontinent$
group by
	len(Nazvanie)
order by
	Kol_Stran DESC;

/* 25 ������� */
Select
	floor(sum(KolNas) * 1.1) as Kol_Nas, Kontinent
From 
	Tabl_Kontinent$
group by
	Kontinent

/* 26 ������� */
Select
	Kontinent
From 
	Tabl_Kontinent$
group by
	Kontinent
having
	floor(max(PL) / min(PL)) <= 10000

/* 27 ������� */
Select
	avg(len(Nazvanie)) as Res1
From 
	Tabl_Kontinent$
where
	Kontinent = '������'

/* 28 ������� */
Select
	Kontinent
	from 
		Tabl_Kontinent$
where 
	KolNas > 1000000
	group by
		Kontinent
having 
	avg(cast(KolNas as float) / PL) > 30