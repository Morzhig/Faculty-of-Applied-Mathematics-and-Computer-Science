/* 1.1 */
select 
	predmet, ush, count(fio) as kol
from 
	Tablica
Group by
	predmet, ush

/* 1.2 */
select 
	predmet, ush, count(fio) as kol
from 
	Tablica
Group by
	predmet, ush with rollup

/* 2.1 */
select 
	predmet, ush, count(fio) as kol
from 
	Tablica
Group by
	predmet, ush

/* 2.2 */
select 
	predmet, ush, count(fio) as kol
from 
	Tablica
Group by
	predmet, ush with cube

/* 3 */
select 
	predmet, ush, count(fio) as kol
from 
	Tablica
Group by
	grouping sets(predmet, ush)

/* 4 */
select 
	coalesce(predmet, 'ИТОГО') as predmet,
	coalesce(ush, 'Итого') as ush,
	count(fio) as kol
from 
	Tablica
Group by
	rollup(predmet, ush)

/* 5 */
select 
	iif(grouping(predmet) = 1, 'ИТОГО', predmet) as predmet,
	iif(grouping(ush) = 1, 'Итого', ush) as ush,
	count(fio) as kol
from 
	Tablica
Group by
	cube(predmet, ush)

/* 6 */
select 
	case grouping_id(predmet, ush)
		when 1 then 'Итого по предметам'
		when 3 then 'Итого'
		else ''
	end as Итого,
	isnull(predmet, '') as predmet,
	isnull(ush, '') as ush,
	count(fio) as kol
from 
	Tablica
Group by
	rollup(predmet, ush)