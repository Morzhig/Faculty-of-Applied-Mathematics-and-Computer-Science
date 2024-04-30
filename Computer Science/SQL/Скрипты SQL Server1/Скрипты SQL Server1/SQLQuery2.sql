create table CUSTOMERS
(
	id int identity primary key,
	[name] nvarchar(50),
	age int,
	[address] nvarchar(50),
	salary money
);

create table Специальность
(
	[id специальности] int primary key,
	наименование nvarchar(50) constraint notnull
	check (наименование != null),
	foreign key ([id специальности]) references customers(id)
);

insert into customers
values	('Maxim', 35, 'Moscow', 21000),
		('Andrey', 38, 'Krasnodar', 55500),
		('Oleg', 33, 'Rostov', 34000),
		('Masha', 35, 'Moscow', 31500),
		('Ruslan', 34, 'Omsk', 43000)

select top 3 *
from customers;

select * from customers;
select [address], max(salary)
from CUSTOMERS
group by [address]

select * from customers
where [name] between 'user1' and 'user4';

select * from customers
where id not between '3' and '5';

select * from customers
order by
	salary desc, age asc;

select count(distinct [address])
from customers;

select age
from customers
where age like '33';

select min(salary)
from CUSTOMERS
where id <=2;

select * 
from customers 
where salary > 33000;

select id, [name], salary
from customers
where salary >= 40000 and age < 35;

select max(salary)
from customers
where id <= 4;

select *
from customers
where LEFT(salary, 1) = '3';

select *
from customers
order by 
	[name] desc;

select *, sum(salary) as [Сумма]
from customers;

select distinct salary 
from customers;

insert into customers
values	('Dima', 32, 'SP', null),
		('Roma', 34, 'SP', null)
select * 
from customers
where salary is not null;

alter table dbo.customers
add pol varchar(20) check(pol = 'М' Or pol = 'Ж');

select age, count(*) as kol
	from customers
group by 
	age
	having 
		count(*) >= 2;
