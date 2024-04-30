/* 1 */
select
	trim(fio) as ФИО,
	date,
	Specialization,
	Year
from 
	student1

/* 2 */
select 
	fio,
	charindex('o', fio) as Позиция_о
from
	Student1

/* 3 */
select
	fio,
	left(specialization, 3) as Спец_3
from
	Student1

/* 4 */
select 
	fio, 
	date,
	Replace(specialization, 'Mathematics', 'Applied mathematics') as Спец,
	Year
from 
	Student1

/* 5 */
select 
	fio,
	date,
	upper(specialization) as Спец,
	Year
from
	Student1

/* 6 */
select 
	fio,
	reverse(fio) as ФИО_Обр
from 
	Student1
	Название

/* 7 */
select distinct
	replicate(specialization, 4) as Спец_4
from
	Student1

/* 8 */
select
	abs(cos(pi())) as Косинус_Пи,
	abs(sin(pi())) as Синус_Пи,
	abs(tan(pi())) as Тангенс_Пи,
	abs(cot(pi())) as КоТангенс_Пи

/* 9 */
select 
	round(123.456, 3) as Окр3,
	round(123.456, 2) as Окр2,
	round(123.456, 1) as Окр1,
	round(123.456, 0) as Окр0,
	round(123.456, -1) as Окр_1,
	round(123.456, -2) as Окр_2,
	round(123.456, -3) as Окр_3

/* 10 */
select 
	ceiling(123.456) as Больше,
	floor(123.456) as Меньше

/* 11 */
select
	sqrt(25) as Корень,
	square(25) as Квадрат,
	power(25, 3) as Куб

/* 12 */
select 
	getdate() as Сейчас

/* 13 */
select
	day(getdate()) as День,
	month(getdate()) as Месяц,
	year(getdate()) as Год,
	datepart(hour, getdate()) as Час,
	datepart(minute, getdate()) as Минута,
	datepart(SECOND, getdate()) as Секунда,
	datepart(quarter, getdate()) as Квартал,
	datepart(week, getdate()) as Неделя,
	datepart(DAYOFYEAR, getdate()) as День_Года,
	datepart(WEEKday, getdate()) as День_Недели

/* 14 */
select
	dateadd(day, -100, getdate()) as День_100_Назад

/* 15 */
select
	datediff(day, '18950708', '19710412') as Количество_прожитых_дней

/* 16 */
select
	fio,
	case month(Date)
		when 3 then 'Весна'
		when 4 then 'Весно'
		when 5 then 'Весна'
		when 6 then 'Лето'
		when 7 then 'Лето'
		when 8 then 'Лето'
		when 9 then 'Осень'
		when 10 then 'Осень'
		when 11 then 'Осень'
		else
			'Зима'
		end as Времена_Года
from student1

/* 17 */
select
	fio,
	Date,
	Specialization,
	Year,
	iif(Year - Year(Date) <= 18, 'Молодой', 'Старше')
	as Возраст_При_Поступлении
from
	Student1

/* 18 */
select
	fio,
	date,
	case
		when(month(date) = 3 and day(date) >= 21) or
		(month(date) = 4 and day(date) <= 20) then 'Овен'
		when(month(date) = 4 and day(date) >= 21) or
		(month(date) = 5 and day(date) <= 21) then 'Телец'
		when(month(date) = 5 and day(date) >= 22) or
		(month(date) = 6 and day(date) <= 22) then 'Близнецы'
		when(month(date) = 6 and day(date) >= 22) or
		(month(date) = 7 and day(date) <= 22) then 'Рак'
		when(month(date) = 7 and day(date) >= 23) or
		(month(date) = 8 and day(date) <= 21) then 'Лев'
		when(month(date) = 8 and day(date) >= 22) or
		(month(date) = 9 and day(date) <= 23) then 'Дева'
		when(month(date) = 9 and day(date) >= 24) or
		(month(date) = 10 and day(date) <= 23) then 'Весы'
		when(month(date) = 10 and day(date) >= 24) or
		(month(date) = 11 and day(date) <= 22) then 'Скорпион'
		when(month(date) = 11 and day(date) >= 23) or
		(month(date) = 12 and day(date) <= 22) then 'Стрелец'
		when(month(date) = 12 and day(date) >= 23) or
		(month(date) = 1 and day(date) <= 20) then 'Козерог'
		when(month(date) = 1 and day(date) >= 21) or
		(month(date) = 2 and day(date) <= 19) then 'Водолей'
		when(month(date) = 2 and day(date) >= 20) or
		(month(date) = 3 and day(date) <= 20) then 'Рыбы'
		end as Знак_Зодиака
from 
	Student1