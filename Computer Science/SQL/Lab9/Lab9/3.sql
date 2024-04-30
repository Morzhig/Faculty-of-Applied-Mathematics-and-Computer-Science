/* 1 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent, Round(cast(PL as float) * 100 /
	(
		select 
			sum(PL)
		from
			Tabl_Kontinent$
	), 3) as Процент
from 
	Tabl_Kontinent$
Order by
	Процент desc

/* 2 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent
from
	Tabl_Kontinent$
where
	cast(KoLNas / PL as float) > (
	select 
		avg(cast(KoLNas / PL as float))
	from 
		Tabl_Kontinent$
	)

/* 3 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent
from
	(
		select 
			Nazvanie, Stolica, PL, 
			KolNas, Kontinent
		from
			Tabl_Kontinent$
		where
			Kontinent = 'Европа') A
where
	KolNas < 5000000

/* 4 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent, round(cast(PL as float) * 100 /
	(
		select 
			sum(PL)
		from 
			Tabl_Kontinent$ Б
		where
			A.Kontinent = Б.Kontinent
	), 3) as Процент
from
	Tabl_Kontinent$ A
order by
	Процент desc

/* 5 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent
from
	Tabl_Kontinent$ A
where
	PL > 
	(
		select 
			avg(PL)
		from
			Tabl_Kontinent$ B
		where
			B.Kontinent = A.Kontinent
	)

/* 6 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent
from	
	Tabl_Kontinent$
where
	Kontinent in 
	(
		select 
			Kontinent 
		from
			Tabl_Kontinent$
		group by
			Kontinent
			having
				avg(cast(KoLNas / PL as float)) > 
				(
					select	
						avg(cast(KoLNas / PL as float))
					from
						Tabl_Kontinent$
						)
				)

/* 7 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent
from
	Tabl_Kontinent$
where
	Kontinent = 'Южная Америка'
	and
	KolNas > ALL
	(
		Select
			KolNas
		from
			Tabl_Kontinent$
		Where
			Kontinent = 'Африка'
	)

/* 8 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent
from
	Tabl_Kontinent$
where
	Kontinent = 'Африка'
	and
	KolNas > ANY
	(
		Select
			KolNas
		from
			Tabl_Kontinent$
		Where
			Kontinent = 'Южная Америка'
	)

/* 9 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent
from
	Tabl_Kontinent$
where
	Kontinent = 'Африка'
	and
	exists
	(
		Select
			*
		from
			Tabl_Kontinent$
		Where
			Kontinent = 'Африка'
			and
			KolNas > 2000000
	)

/* 10 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent
from
	Tabl_Kontinent$
where
	Kontinent = 
	(
		Select
			Kontinent
		from
			Tabl_Kontinent$
		Where
			Nazvanie = 'Фиджи'
	)

/* 11 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent
from
	Tabl_Kontinent$
where
	KolNas !>
	(
		Select
			KolNas
		from
			Tabl_Kontinent$
		Where
			Nazvanie = 'Фиджи'
	)

/* 12 */
select 
	Nazvanie, Stolica, PL, 
	KolNas, Kontinent
from
	Tabl_Kontinent$
where
	PL =
	(
		Select
			max(Мин_Пл)
		from
			(
				select	
					min(PL) as Мин_Пл
				from
					Tabl_Kontinent$
				group by
					Kontinent
			) A
	)