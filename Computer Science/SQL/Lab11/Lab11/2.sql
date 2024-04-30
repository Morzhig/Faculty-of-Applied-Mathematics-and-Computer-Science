/* 1 */
go
create View pred1

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
	Kontinent = 'Африка'
	and kolnas < 10000000
	and pl > 500000

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
create view pred2
(
	kontinent,
	pl,
	kolnas
)
as
select
	kontinent,
	avg(pl),
	avg(kolnas/pl)
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
	pred2

/* 3 */
go
create view pred3
(
	Фамилия,
	Должность,
	Звание,
	Степень,
	Кафедра,
	Экзаменов
)

as select
	fio,
	dolgn,
	zvanie,
	stepen,
	nkaf,
	Tab_Nom
from
	Sotrudnik C
		inner join Prepodavatel P on C.TablNom = P.TabNom_Pr
		inner join Kafedra K on C.ShifrKaf_Sotr = K.ShifrKaf
		inner join Ozenka O on C.TablNom = O.Tab_Nom

go 
select
	Фамилия, 
	Должность,
	Звание,
	Степень,
	Кафедра,
	Экзаменов
from
	pred3

/* 4 */
declare @pred4 table
(
	[Номер месяца] int, 
	[Название месяца] varchar(50),
	[Количество дней] int
)

declare 
	@t as date, 
	@n int = 1

set @t = cast(year(getdate()) as char(4)) + '0101'

while datepart(weekday, @t) >1
	set @t = dateadd(day, -1, @t)

print datepart(week, @t)
while year(@t) < year(dateadd(year, 1, getdate()))
	begin
		insert @pred4
		values (@n, datename(month, @t), day(eomonth(@t)))
		set @t = dateadd(day, day(eomonth(@t)) + 1, @t)
		set @n = @n + 1
	end
select 
	[Название месяца], 
	[Номер месяца], 
	[Количество дней] 
from 
	@pred4

/* 5 */
declare @pred5 table
(
	Название varchar(20),
	Столица varchar(20),
	Площадь int,
	Население int,
	Континент varchar(20)
)

insert into @pred5
select 
	Nazvanie, 
	Stolica, 
	PL, 
	KolNas, 
	Kontinent 
from 
	Tabl_Kontinent$ A
	where PL < (select avg(Pl) 
	from 
		Tabl_Kontinent$ B 
		where B.Kontinent = A.Kontinent) / 100

select 
	Название, 
	Столица,	
	Площадь, 
	Население, 
	Континент 
from 
	@pred5

/* 6 */
select 
	Datepart(week, data) as [Номер недели],
	count(distinct Kod) as [Количество экзаменов],
	count(distinct ReGNom) as [Количество студентов] 
	into 
		#pred6
from 
	Ozenka
group by 
	Datepart(week, data)

select * from #pred6

/* 7 */
create table ##pred7
(
	Континент varchar(50),
	[Максимальная площадь] int,
	[Минимальная площадь] int
)

insert into ##pred7
	(Континент, [Максимальная площадь], [Минимальная площадь])
select 
	Kontinent, 
	Max(Pl) as [Максимальная площадь], 
	Min(Pl) as [Минимальная площадь]
from 
	Tabl_Kontinent$
group by 
	Kontinent

select * from ##pred7

/* 8 */
with СЗК as
(
	select 
		F.NFak as Факультет, 
		F.ABfak, 
		K.ShifrKaf,
		avg(Zarplata) as [Средняя зарплата по факультету] 
	from 
		Sotrudnik C
			inner join Kafedra K on C.ShifrKaf_Sotr = K.ShifrKaf
			inner join Fakultet F on F.ABfak = K.AbFaK_Kaf
	group by 
		K.ShifrKaf, F.ABfak, F.NFak
)

select 
	C.FIO, 
	C.Zarplata, 
	З.Факультет, 
	З.[Средняя зарплата по факультету] 
from 
	Sotrudnik C
		inner join СЗК З on C.ShifrKaf_Sotr = З.ShifrKaf 
		where C.Zarplata < З.[Средняя зарплата по факультету]

/* 9 */
drop view pred1
drop view pred2
drop view pred3
