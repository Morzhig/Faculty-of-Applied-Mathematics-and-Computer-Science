create table CUSTOMERS
(
	id int identity primary key,
	[name] nvarchar(50),
	age int,
	[address] nvarchar(50),
	salary money
);

insert into customers
values	('Maxim', 35, 'Moscow', 21000),
		('Andrey', 38, 'Krasnodar', 55500),
		('Oleg', 33, 'Rostov', 34000),
		('Masha', 35, 'Moscow', 31500),
		('Ruslan', 34, 'Omsk', 43000)