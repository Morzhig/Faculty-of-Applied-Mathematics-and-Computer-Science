/* 1 */
declare @a int, @b int, @c int
set @a = 5
set @b = 10
set @c = @a * @b 
print @c

/* 2 */
declare @licey float, @gimn float, @diff float

set @licey = (select avg(ball) from Tablica
where ush = 'Лицей')

set @gimn = (select avg(ball) from Tablica
where ush = 'Гимназия')

set @diff = abs(@licey - @gimn)

print @diff

/* 3 */
declare @count int = (select count(fio) from tablica)
if @count % 2 = 0
	print 'Количество строк четно'
else
	print 'Количество строк не четно'

/* 4 */
declare @a1 int = rand() * 9999, @sum int = 0, @temp int
set @temp = @a1
while @a1 != 0
begin
	set @sum = @sum + @a1 % 10
	set @a1 = @a1 / 10
end
print 'Для числа ' + cast(@temp as varchar(4)) + ' сумма цифр равна ' + cast(@sum as varchar(4)) 

/* 5 */
declare @a2 int = rand() * 10, 
		@b2 int = rand() * 10,
		@c2 int = rand() * 10,
		@temp2 int
print @a2
print @b2
print @c2
if @a2 < @b2
	if @c2 < @a2
		set @temp2 = @c2
	else
		set @temp2 = @a2
else
	if @b2 < @c2
		set @temp2 = @b2
	else 
		set @temp2 = @c2
print cast(@temp2 as varchar(2)) + ' - наименьшее число'

/* 6 */
declare @a3 int = rand() * 100
if @a3 % 11 = 0
	print cast(@a3 as varchar(4)) + ' делится'
else
	print cast(@a3 as varchar(4)) + ' не делится'

/* 7 */
declare @n int = rand()*1000
print @n
while @n % 3 = 0
	set @n = @n / 3
if @n = 1
	print 'Да'
else
	print 'Нет'

/* 8 */
declare @a4 int = rand() * 100,
		@b4 int = rand() * 100,
		@m int
print @a4
print @b4
set @m = @a4 * @b4
while @a4 != 0 and @b4 != 0
	begin
		if @a4 > @b4
			set @a4 = @a4 % @b4
		else
			set @b4 = @b4 % @a4
	end
print @m / (@a4 + @b4)

/* 9 */
declare @a5 int = 1,
		@b5 int = 10,
		@sum1 int = 0
while @a5 != @b5 + 1
	begin
		set @sum1 = @sum1 + @a5
		set @a5 = @a5 + 1
	end
print @sum1 

/* 10 */
declare @a6 int = 1, @count1 int = 0
while @count1 != 1
	begin
		if  @a6 % 2 = 1 and @a6 % 3 = 1 and
			@a6 % 4 = 1 and @a6 % 5 = 1 and
			@a6 % 7 = 0
			set @count1 = @count1 + 1
		else
			set @a6 = @a6 + 1
	end
print @a6
	
/* 11 */
declare @name char(8) = 'Карпович', @count2 int = 0
while @count2 < len(@name)
	begin
		print(@name)
		set @count2 = @count2 + 1
	end