/* 1 */
select 
	otdel, god, sum(summa) as itog
	from dbo.test_table
group by 
	otdel, god
order by
	otdel, god

/* 2 */
select 
	otdel, god, sum(summa) as itog
	from dbo.test_table
group by 
rollup (otdel, god)

/* 3 */
select 
	otdel, sum(summa) as itog
	from dbo.test_table
group by 
rollup (otdel)

select 
	god, sum(summa) as itog
	from dbo.test_table
group by 
rollup (god)

/* 4 */
select 
	otdel, god, sum(summa) as itog
	from dbo.test_table
group by 
cube (otdel, god)

/* 5 */
select 
	otdel, god, sum(summa) as itog
	from dbo.test_table
group by 
grouping sets (otdel, god)

/* 6 */
select 
	otdel, isnull(cast(god as varchar(30)),
		case when grouping(god) = 1 and grouping(otdel)= 0
			then 'Промежуточный итог' else 'Общий итог' end) 
			as god,
		sum(summa) as itog,
		grouping (otdel) as grouping_otdel,
		grouping(god) as grouping_god
	from dbo.test_table
group by 
rollup (otdel, god)
