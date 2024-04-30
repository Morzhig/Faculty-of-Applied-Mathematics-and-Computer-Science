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
	Kontinent = '������'
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
	�������,
	���������,
	������,
	�������,
	�������,
	���������
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
	�������, 
	���������,
	������,
	�������,
	�������,
	���������
from
	pred3

/* 4 */
declare @pred4 table
(
	[����� ������] int, 
	[�������� ������] varchar(50),
	[���������� ����] int
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
	[�������� ������], 
	[����� ������], 
	[���������� ����] 
from 
	@pred4

/* 5 */
declare @pred5 table
(
	�������� varchar(20),
	������� varchar(20),
	������� int,
	��������� int,
	��������� varchar(20)
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
	��������, 
	�������,	
	�������, 
	���������, 
	��������� 
from 
	@pred5

/* 6 */
select 
	Datepart(week, data) as [����� ������],
	count(distinct Kod) as [���������� ���������],
	count(distinct ReGNom) as [���������� ���������] 
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
	��������� varchar(50),
	[������������ �������] int,
	[����������� �������] int
)

insert into ##pred7
	(���������, [������������ �������], [����������� �������])
select 
	Kontinent, 
	Max(Pl) as [������������ �������], 
	Min(Pl) as [����������� �������]
from 
	Tabl_Kontinent$
group by 
	Kontinent

select * from ##pred7

/* 8 */
with ��� as
(
	select 
		F.NFak as ���������, 
		F.ABfak, 
		K.ShifrKaf,
		avg(Zarplata) as [������� �������� �� ����������] 
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
	�.���������, 
	�.[������� �������� �� ����������] 
from 
	Sotrudnik C
		inner join ��� � on C.ShifrKaf_Sotr = �.ShifrKaf 
		where C.Zarplata < �.[������� �������� �� ����������]

/* 9 */
drop view pred1
drop view pred2
drop view pred3
