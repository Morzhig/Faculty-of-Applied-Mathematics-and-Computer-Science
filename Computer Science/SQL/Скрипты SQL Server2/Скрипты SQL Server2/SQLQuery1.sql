create table tab1 
(
	id int,
	k char(1)
)

insert into tab1 
values	(1, 'a'),
		(2, 'b'),
		(3, 'c'),
		(4, 'd')

create table tab2
(
	id1 int
)

insert into tab2
values	(5),
		(6)

select tab1.*
from
	tab1
	left join tab2 on tab2.id1 = tab1.id
where tab2.id1 is null

select 
	datediff(day, GETDATE(), '20230323')

select top 1
	id
from tab1
order by
	id desc

create table tab3 
(
	id int,
	k char(1)
)

insert into tab3 
values	(5, 'e'),
		(6, 'f'),
		(7, 'g'),
		(8, 'h')

select distinct *
from
	tab1, tab2