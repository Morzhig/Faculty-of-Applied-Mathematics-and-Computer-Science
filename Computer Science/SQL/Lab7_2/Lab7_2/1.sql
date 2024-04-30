/* 1 */
select
		'Количество' as [Количество учеников по предметам],
		Математика,
		Физика,
		Химия
from
		(
			select
				predmet, fio
				from
				Tablica
		)
		as SOURCE_TABLE
		pivot
		(
			count(fio)
			for predmet in(Математика, Физика, Химия)
		) as PIVOT_TABLE

/* 2 */
select
		ush,
		Математика,
		Физика,
		Химия
from
		(
			select
				ush, predmet, fio
				from
				Tablica
		)
		as SOURCE_TABLE
		pivot
		(
			count(fio)
			for predmet in(Математика, Физика, Химия)
		) as PIVOT_TABLE

/* 3 */
select
		fio, [Предмет или школа]
from Tablica
unpivot(
		[Предмет или школа] for Значение in(ush, predmet)) unpvt

/* 4 */
select
		'Средний балл' as [Средний балл учеников по школам],
		Гимназия,
		Лицей
from
		(
			select
				ball, ush
				from
				Tablica
		)
		as SOURCE_TABLE
		pivot
		(
			avg(ball)
			for ush in(Гимназия, Лицей, Химия)
		) as PIVOT_TABLE

/* 5 */
select
		predmet,
		Гимназия,
		Лицей
from
		(
			select
				ush, predmet, ball
				from
				Tablica
		)
		as SOURCE_TABLE
		pivot
		(
			avg(ball)
			for ush in(Гимназия, Лицей, Химия)
		) as PIVOT_TABLE

/* 6 */
select
		[Предмет или фамилия или школа]
from Tablica
unpivot(
		[Предмет или фамилия или школа] for 
		Значение in(predmet, fio, ush)) unpvt