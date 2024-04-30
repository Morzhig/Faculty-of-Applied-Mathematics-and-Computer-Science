/* 1 */
select 
	*, len(fio) as Длина
from Student1
order by
	len(fio)

/* 2 */
select
	trim(fio) as ФИО,
	date,
	Specialization,
	Year
from 
	student1

/* 3 */
select 
	fio,
	charindex('ov', fio) as Позиция_ов
from
	Student1

/* 4 */
select
	fio,
	right(specialization, 2) as Последние_2
from 
	student1

/* 6 */
select distinct
	specialization,
	reverse(specialization) as Обратный
from
	Student1

/* 7 */
select
	replicate('Karpovich', 9) as Фамилия

/* 8 */
select
	abs(round(square(sin(pi()/2)) - cos(3*pi()/2), 2))

/* 9 */
select
	datediff(day, getdate(), '20230630') as Количество

/* 10 */
select
	datediff(day, '20040823', getdate())/30 as Количество_прожитых_месяцев

/* 11 */
select distinct
	specialization,
	case
		when(len(specialization) > 7) then 'Длинный'
		else 'Короткий'
		end as Спец
from
	Student1
