/* 1 */
declare @a int, @b int, @c int
set @a = 5
set @b = 10
set @c = @a + @b print @c

/* 2 */
declare @licey float, @gimn float, @diff float

set @licey = (select max(ball) from Tablica
where ush = 'Лицей')

set @gimn = (select max(ball) from Tablica
where ush = 'Гимназия')

set @diff = abs(@licey - @gimn)

print @diff

/* 3 */
declare @maxp float, @minp float, @diff float
select
	@maxp = max(ball),
	@minp = min(ball)
from
	Tablica
set @diff = @maxp-@minp
print @diff

/* 4 */
declare @a1 int, @b1 int
set @a1 = rand()*1000
set @b1 = square(@a1)
print @a1
print @b1

/* 5 */
declare @a2 int = Rand()*100, @b2 int = rand()*100
if @a2 > @b2
	print '@a2 = ' + cast (@a2 as varchar(3))
else
	print '@b2 = ' + cast (@b2 as varchar(3))

/* 6 */
declare @a3 int = rand()*100
	if @a3 % 3 = 0
		print cast(@a3 as varchar(3)) + ' делится на 3'
	else 
		print cast(@a3 as varchar(3)) + ' не делится на 3'

/* 7 */
declare @a4 int = rand()*1000
print @a4
while @a4 % 5 = 0
	set @a4 = @a4 / 5
if @a4 = 1
	print 'Да'
else
	print 'Нет'

/* 8 */
declare @a5 int = rand() * 1000, @b5 int = rand() * 1000
print '@a5 = ' + cast(@a5 as varchar(4))
print '@b5 = ' + cast(@b5 as varchar(4))

while @a5 != @b5
begin
	if @a5 > @b5
		set @a5 = @a5 - @b5
	else
		set @b5 = @b5 - @a5
end
print 'НОД = ' + cast(@a5 as varchar(4))

/* 9 */
declare @a6 int = 5, @b6 int = 10, @s int = 0
while @a6 <= @b6
begin
	set @s = @s + @a6
	set @a6 = @a6 + 1
end
print 'Сумма = ' + cast(@s as varchar(5))

/* 10 */
declare @n int = rand() * 10, @m int = 1, @s1 int = 0
while @m <= 2 * @n - 1
begin 
	set @s1 = @s1 + @m
	print @s1
	set @m = @m + 2
end

/* 11 */
declare @a7 int = rand() * 5, @c7 int = 1
declare @b7 int = @a7 + rand() * 5
print '@a7 = ' + cast(@a7 as char(1)) + ', @b7 = ' + cast(@b7 as char(1))
while @a7 <= @b7
begin
	print replicate(@a7, @c7)
	set @a7 = @a7 + 1
	set @c7 = @c7 + 1
end

/* 12 */
declare @a8 int = 10
while @a8 < 100
begin
	if (@a8 % 4 = 0) and (@a8 % 6 != 0)
		print @a8
	set @a8 = @a8 + 1
end

/* 13 */
declare @d int = 31, @m int = 12
set @d = case	
			when @m in (1, 3, 5, 7, 8, 10, 12) and @d = 31 then 1
			when @m in (4, 6, 9, 11) and @d = 30 then 1
			when @m = 2 and @d = 29 then 1
			else
				@d + 1
		end
set @m = case
			when @d = 1 and @m = 12 then 1
			when @d = 1 and @m < 12 then @m + 1
			else @m
		end
print cast(@d as varchar(2)) + '/' + cast(@m as varchar(2))

/* 14 */
declare @l int, @n1 char(13) = 'Нижневартовск'
set @l = len(@n1)
while @l > 0
begin
	print @n1
	set @l = @l - 1
end

/* 15 */
declare @l2 int, @m2 int, @n2 char(13)
set @n2 = 'Нижневартовск'
set @l2 = len(@n2)
set @m2 = @l2
while @l2 > 0
begin
	print left(@n2, @l2) + space (2 * (@m2 - @l2)) + right(reverse(@n2), @l2) 
	set @l2 = @l2 - 1
end
set @l2 = 2
while @l2 <= @m2
begin
	print left(@n2, @l2) + space(2 * (@m2 - @l2)) + right(reverse(@n2), @l2)
	set @l2 = @l2 + 1
end

