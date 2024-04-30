/* 1 */
go
Create View PR1

as
select
	nazvanie,
	stolica,
	pl,
	kolnas,
	kontinent
from
	Tabl_Kontinent$
where
	kolnas < 5000000
	and pl > 100000

go
select
	nazvanie,
	stolica,
	pl,
	kolnas,
	kontinent
from
	pr1

/* 2 */
go
create view pr2
(
	kontinent,
	pl,
	kolnas
)
as
select
	kontinent,
	sum(pl),
	sum(kolnas)
from
	Tabl_Kontinent$
group by
	Kontinent
go
select
	kontinent,
	pl,
	kolnas
from
	pr2

/* 3 */
go
create view pr3
(
	Фамилия,
	Должность,
	Звание,
	Степень,
	Кафедра,
	Зарплата
)

as select
	fio,
	dolgn,
	zvanie,
	stepen,
	nkaf,
	zarplata
from
	Sotrudnik C
		inner join Prepodavatel P on C.TablNom = P.TabNom_Pr
		inner join Kafedra K on C.ShifrKaf_Sotr = K.ShifrKaf

go
select
	Фамилия, 
	Должность,
	Звание,
	Степень,
	Кафедра,
	Зарплата
from
	pr3

/* 4 */
declare @pr4 table
(
	[Номернедели] int, 
	[Датаначала] date,
	[Датаконца] date
)
declare @t as date, @n int = 1
set @t = cast(year(getdate()) as char(4)) + '0101'
while datepart(weekday, @t) > 1
	set @t = dateadd(day, -1, @t)
print datepart(week, @t)
while year(@t) < year(dateadd(year, 1, getdate()))
begin
	insert
		@pr4
	values
		(@n, @t, dateadd(day, 6, @t))

	set @t = dateadd(day, 2, @t)
	set @n = @n + 1
end

select
	[Номернедели],
	[Датаначала],
	[Датаконца] 
from
	@pr4

/* 5 */
declare @pr5 table
(
	Название varchar(50),
	Столица varchar(50),
	Площадь int,
	Население int,
	Континент varchar(50)
)
insert into @pr5
select
	nazvanie,
	stolica,
	pl,
	kolnas,
	kontinent
from
	Tabl_Kontinent$
where
	pl < (select AVG(pl) from Tabl_Kontinent$) / 1000
select
	Название,
	Столица,
	Площадь,
	Население,
	Континент
from
	@pr5

/*  6 */
select
	datename(month, data) as [Название месяца],
	count(distinct kod) as [Количество экзаменов],
	count(distinct regnom) as [Количество студентов]
	into #pr6
from
	Ozenka
group by
	datename(month, data)

select * from #pr6

/* 7 */
create table ##pr7
(
	Название varchar(50),
	Плотность float
)
insert into 
	##pr7 (Название, Плотность)
select 
	nazvanie, 
	round(Kolnas / pl, 0) as Плотность
from Tabl_Kontinent$

select * from ##pr7

/* 8 */
with СЗК as
(
	select 
		k.nkaf as Кафедра,
		k.shifrkaf,
		avg(Zarplata) as [Средняя зарплата по кафедре] 
	from
		Sotrudnik C 
		inner join Kafedra K on C.ShifrKaf_Sotr = K.ShifrKaf
	group by
		K.NKaf, K.ShifrKaf
)
select
	C.fio,
	c.zarplata,
	З.Кафедра,
	З.[Средняя зарплата по кафедре]
from
	Sotrudnik C
	inner join СЗК З on C.ShifrKaf_Sotr = З.ShifrKaf where
		C.zarplata < З.[Средняя зарплата по кафедре]