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
	�������,
	���������,
	������,
	�������,
	�������,
	��������
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
	�������, 
	���������,
	������,
	�������,
	�������,
	��������
from
	pr3

/* 4 */
declare @pr4 table
(
	[�����������] int, 
	[����������] date,
	[���������] date
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
	[�����������],
	[����������],
	[���������] 
from
	@pr4

/* 5 */
declare @pr5 table
(
	�������� varchar(50),
	������� varchar(50),
	������� int,
	��������� int,
	��������� varchar(50)
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
	��������,
	�������,
	�������,
	���������,
	���������
from
	@pr5

/*  6 */
select
	datename(month, data) as [�������� ������],
	count(distinct kod) as [���������� ���������],
	count(distinct regnom) as [���������� ���������]
	into #pr6
from
	Ozenka
group by
	datename(month, data)

select * from #pr6

/* 7 */
create table ##pr7
(
	�������� varchar(50),
	��������� float
)
insert into 
	##pr7 (��������, ���������)
select 
	nazvanie, 
	round(Kolnas / pl, 0) as ���������
from Tabl_Kontinent$

select * from ##pr7

/* 8 */
with ��� as
(
	select 
		k.nkaf as �������,
		k.shifrkaf,
		avg(Zarplata) as [������� �������� �� �������] 
	from
		Sotrudnik C 
		inner join Kafedra K on C.ShifrKaf_Sotr = K.ShifrKaf
	group by
		K.NKaf, K.ShifrKaf
)
select
	C.fio,
	c.zarplata,
	�.�������,
	�.[������� �������� �� �������]
from
	Sotrudnik C
	inner join ��� � on C.ShifrKaf_Sotr = �.ShifrKaf where
		C.zarplata < �.[������� �������� �� �������]