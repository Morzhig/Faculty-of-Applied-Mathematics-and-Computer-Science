/* 1 */
select 
	predmet, ush, max(ball) as kol
from 
	Tablica
Group by
	rollup(predmet, ush)

/* 2 */
select 
	predmet, ush, min(ball) as kol
from 
	Tablica
Group by
	rollup(predmet, ush)

/* 3 */
select 
	predmet, ush, avg(ball) as res
from 
	Tablica
Group by
	predmet, ush

/* 4 */
select 
	isnull(predmet, '') as predmet,
	isnull(ush, '') as ush,
	count(fio) as kol
from 
	Tablica
Group by
	rollup(predmet, ush)

/* 5 */
select 
	coalesce(predmet, '�����') as predmet,
	coalesce(ush, '�����') as ush,
	sum(ball) as res
from 
	Tablica
Group by
	rollup(predmet, ush)

/* 6 */
select 
	case grouping_id(predmet, ush)
		when 1 then '����� �� ���������'
		when 3 then '�����'
		else ''
	end as �����,
	isnull(predmet, '') as predmet,
	isnull(ush, '') as ush,
	max(ball) as res
from 
	Tablica
Group by
	rollup(predmet, ush)