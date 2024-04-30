/* 3 */
	/* 1 */
	select * from Cars
	select * from Clients
	select * from Orders

	/* 2 */
	select 
		Brand
	from	
		Cars
	order by
		Brand

	/* 3 */
	select 
		Brand,
		Model
	from
		Cars
	order by
		Brand, Model DESC

	/* 4 */
	select distinct
		Brand,
		sum(Cost) as Цена
	from
		Cars
	group by
		Brand

	/* 5 */
	select top 30 percent * from Cars

	/* 6 */
	select top 5 * from Cars

	/* 8 */
	select *, 
		cost / amount_Days as [Стоимость одного дня]
	from
		orders
	order by
		cost / amount_Days

	/* 9 */
	Select 
		Brand + ' ' + Model + ' ' as CarName,
		Cost
	into CarSummary
	from
		Cars

	select * from CarSummary

/* 4 */
	/* 1 */
	select *
	from
		Cars
	where 
		cost > 500

	/* 2 */
	select *
	from
		Cars
	where 
		Availability = 'Available'

	/* 3 */
	select *
	from Orders
	where
		cost > 1000 and amount_Days < 4

	/* 4 */
	select *
	from Orders
	where
		cost > 1000 and amount_Days < 4
		or
		cost > 1500 and amount_Days > 4
	
	/* 5 */
	select *
	from
		Cars
	where 
		cost between 300 and 500

	/* 6 */
	select *
	from
		orders
	where	
		date_order between '2023-06-01' and '2023-08-31'

	/* 7 */
	select *
	from
		Clients
	where 
		Full_Name like '[m]%'

/* 5 */
	/* 1 */
	go
	sp_rename 'Cars', 'Vehicles'

	go
	sp_rename 'Vehicles', 'Cars'

/* 6 */
	insert into Cars 
	values	('11', 'Mercedes-Benz', 'E63s AMG', 'Gray', 'Available', '700'),
			('12', 'Ferrari', '488', 'Red', 'Available', '800')

	insert into Clients
	values	('11', 'Enzo Ferrari', '12345', '12'),
			('12', 'Kto To', '123456', '11')

	insert into Orders	
	values	('11', '11', '12', '2023-05-04', '3', '2023-05-07', 2400),
			('12', '12', '11', '2023-04-05', '1', '2023-04-05', 700)

/* 7 */
	/* 1 */
	alter Table dbo.Cars
	add Plate nvarchar(7)
	
	/* 2 */
	alter Table dbo.Cars
	add constraint CK_Car
	Check (isnumeric(left(number, 4)) = true);

/* 8 */
	/* 1 */
	select 
		Brand,
		count(model) as [Количество моделей]
	from
		Cars
	group by
		Brand

	/* 2 */
	select 
		avg(amount_days) as [Дней в среднем]
	from 
		Orders

	/* 3 */
	select
		min(cost) as [Минимальная стоимость заказа]
	from
		Orders

	/* 4 */
	select
		max(cost) as [Максимальная стоимость заказа]
	from
		Orders

	/* 5 */
	select 
		Availability,
		sum(cost) as [Цена доступных машин]
	from
		Cars
	group by
		Availability

/* 10 */
	/* 1 */
	select 
		count(Brand) as [Количество машин],
		colour
	from
		Cars
	group by
		Colour
	having
		Count(Brand) > 1

/* 11 */
	/* 1 */
	select 
		brand,
		count(model) as [Количество]
	from
		Cars
	group by
		rollup(brand)
	
	/* 2 */
	select 
		Cost,
		brand,
		count(model) as [Количество]
	from
		Cars
	group by
		cube(Cost, brand)

	/* 3 */
	select 
		Cost,
		brand,
		count(model) as [Количество]
	from
		Cars
	group by
		grouping sets(Cost, brand)

	/* 4 */
	select
		Brand,
		Model,
		count(*) over(partition by Brand) as [Количество моделей по марке]  
	from
		Cars

/* 12 */
	/* 1 */
	select
		'Количество' as [Заказы летом],
		Июнь,
		Июль,
		Август
	from
		(
			select 
				id_Order,
				date_Order
			from
				Orders
		) as source_table
	pivot
		(
			count(id_Order) for date_order
			in (month(date_order), month(date_order), Август)
		) as pivot_table
		

/* 13 */
	/* 1 */
	select 
		*
	from 
		Cars
		inner join Clients on Cars.id_Auto = Clients.id_Auto

	/* 2 */
	select
		*
	from
		Cars
		left join Clients on Cars.id_Auto = Clients.id_Auto

	/* 3 */
	select
		*
	from
		Cars
		right join Clients on Cars.id_Auto = Clients.id_Auto
	
	/* 4 */
	select
		*
	from
		Cars
		join Clients on Cars.id_Auto = Clients.id_Auto

/* 14 */
	/* 1 */
	select 
		id_auto as ids,
		Brand as names
	from
		Cars
	union all
	select
		id_client,
		Full_Name
	from
		Clients

	/* 2 */
	select 
		id_auto as ids
	from
		Cars
	intersect
	select
		id_auto
	from
		Clients

	/* 3 */
	select 
		id_auto as ids
	from
		Cars
	except
	select
		id_auto
	from
		Clients

/* 15 */
	/* 1 */
	select 
		*
	from
		Clients
	where 
		id_auto = any(select id_auto 
						from cars 
						where id_Auto != 3)
	
	/* 2 */
	select 
		Brand,
		Model,
		Cost
	from 
		Cars
	where
		Cost <= All (select cost
					from Orders)

	/* 3 */
	select
		Brand + ' ' + Model as [Автомобиль],
		Cost
	from
		Cars	
	where
		Brand in (select brand
				from cars
				group by 
				brand having avg(cost) > (select avg(cost) from cars))

	/* 4 */
	select 
		Brand + ' ' + Model as [Автомобиль],
		Cost
	from
		Cars	
	where
		exists (select *
				from cars
				group by 
				brand having avg(cost) > (select avg(cost) from cars))

/* 16 */
	/* 1 */
	select 
		Brand,
		len(Brand) as [Длина названий марок]
	from cars

	/* 2 */
	select 
		concat(Brand, ' ', Model) as [Марка и модель]
	from cars

	/* 3 */
	select 
		reverse(Brand) as [Марка наоборот]
	from cars

	/* 4 */
	select
		brand,
		replace(brand, 'BMW', 'Mercedes') as [Замена]
	from
		Cars

/* 17 */
	/* 1 */
	select 
		*,
		sqrt(cost) as [Корень цен]
	from Cars


	/* 3 */
	select 
		*,
		power(cost, 3) as [Куб цен]
	from cars

	/* 4 */
	select 
		id_Order,
		id_Client,
		id_Auto,
		amount_days,
		cost,
		round(cost / amount_days, 3) as [Округление]
	from orders

/* 18 */
	/* 1 */
	go 
	create view pr1
	(
		Brand,
		Model,
		Cost
	)
	as select
			Brand,
			count(model),
			sum(cost)
		from
			Cars	
		group by
			Brand
	go
	select
		Brand,
		Model,
		Cost
	from
		pr1

	/* 2 */
	go 
	create view pr2

	as select
			Brand,
			model,
			cost
		from
			Cars	
		where
			cost <= 600
	go
	select
		Brand,
		Model,
		Cost
	from
		pr2

	/* 3 */
	go 
	create view pr3
	(
		[Номер месяца],
		[Стоимость заказов]
	)
	as select
			month(date_Order),
			sum(cost)
		from
			Orders	
		group by
			month(date_order)
	go
	select
		[Номер месяца],
		[Стоимость заказов]
	from
		pr3

	/* 4 */
	go 
	create view pr4
	(
		[Номер месяца],
		[Количество дней]
	)
	as select
			month(date_Order),
			sum(amount_Days)
		from
			Orders	
		group by
			month(date_order)
	go
	select
		[Номер месяца],
		[Количество дней]
	from
		pr4

	/* 5 */
	go 
	create view pr5
	(
		[Заказ],
		[Месяц],
		[Стоимость заказа]
	)
	as select
			id_Order,
			date_Order,
			Cost
		from
			Orders	
		where
			month(date_order) = 8
	go
	select
		[Заказ],
		[Месяц],
		[Стоимость заказа]
	from
		pr5

/* 20 */
	/* 1 */
	declare @pr6 table
	(
		Марка varchar(20),
		Модель varchar(20),
		Стоимость money
	)
	insert into @pr6
	select
		Brand,
		Model,
		Cost
	from
		Cars

	select * from @pr6

	/* 2 */
	select
		datename(month, date_order) as [Название месяцы],
		count(id_Order) as [Количество заказов]
		into #pr7
	from
		Orders
	group by
		datename(month, date_order)

	select * from #pr7

	/* 3 */
	create table ##pr8
	(
		Марка varchar(20),
		[Средняя стоимость] money
	)
	insert into ##pr8 (Марка, [Средняя стоимость])
		select
			Brand,
			avg(cost) as [Средняя стоимость]
		from
			Cars
		group by 
			Brand

	select * from ##pr8

	/* 4 */
	with СЗК as 
	(
		select
			A.Brand as [Марка],
			avg(amount_Days) as [Среднее количество дней] 
		from
			Orders O
			inner join Cars A on A.id_Auto = O.id_Auto
		group by
			O.id_Order, A.Brand
	)

	select * from СЗК