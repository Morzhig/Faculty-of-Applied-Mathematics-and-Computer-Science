/* 1 */
select
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from
	Tabl_Kontinent$
where 
	PL > 1000000

	UNION

select 
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from 
	Tabl_Kontinent$
where
	KolNas > 100000000

/* 2 */
select
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from
	Tabl_Kontinent$
where 
	PL > 1000000

	UNION ALL

select 
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from 
	Tabl_Kontinent$
where
	KolNas > 100000000

/* 3 */
select
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from
	Tabl_Kontinent$
where 
	Kontinent = 'Европа' AND
	cast(KolNas as Float) / PL > 400

	UNION

select 
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from 
	Tabl_Kontinent$
where
	Kontinent = 'Азия' AND
	cast(KolNas as float) / PL > 300

		UNION

select 
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from 
	Tabl_Kontinent$
where
	Kontinent = 'Африка' AND
	cast(KolNas as float) / PL > 200

/* 4 */
select 
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from 
	Tabl_Kontinent$
where
	PL > 1000000

	except

select 
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from 
	Tabl_Kontinent$
where
	KolNas < 1000000

/* 5 */
select 
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from 
	Tabl_Kontinent$
where
	PL > 1000000

	intersect

select 
	Nazvanie, Stolica, PL,
	KolNas, Kontinent
from 
	Tabl_Kontinent$
where
	KolNas > 100000000

/* 6 */
	/* 1 */
	select	
		Nazvanie, Stolica, PL,
		KolNas, Kontinent
	from 
		Tabl_Kontinent$
	where
		PL < 500000

		union
	
	select 
		Nazvanie, Stolica, PL,
		KolNas, Kontinent
	from 
		Tabl_Kontinent$
	where 
		PL > 5000000

	/* 2 */
	select	
		Nazvanie, Stolica, PL,
		KolNas, Kontinent
	from 
		Tabl_Kontinent$
	where
		PL > 1000000

		except
	
	select 
		Nazvanie, Stolica, PL,
		KolNas, Kontinent
	from 
		Tabl_Kontinent$
	where 
		KolNas < 100000000

	/* 3 */
	select	
		Nazvanie, Stolica, PL,
		KolNas, Kontinent
	from 
		Tabl_Kontinent$
	where
		PL > 1000000

		except
	
	select 
		Nazvanie, Stolica, PL,
		KolNas, Kontinent
	from 
		Tabl_Kontinent$
	where 
		KolNas < 100000000