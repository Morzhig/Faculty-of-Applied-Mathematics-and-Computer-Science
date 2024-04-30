/* 1 */
select
	trim(fio) as ���,
	date,
	Specialization,
	Year
from 
	student1

/* 2 */
select 
	fio,
	charindex('o', fio) as �������_�
from
	Student1

/* 3 */
select
	fio,
	left(specialization, 3) as ����_3
from
	Student1

/* 4 */
select 
	fio, 
	date,
	Replace(specialization, 'Mathematics', 'Applied mathematics') as ����,
	Year
from 
	Student1

/* 5 */
select 
	fio,
	date,
	upper(specialization) as ����,
	Year
from
	Student1

/* 6 */
select 
	fio,
	reverse(fio) as ���_���
from 
	Student1
	��������

/* 7 */
select distinct
	replicate(specialization, 4) as ����_4
from
	Student1

/* 8 */
select
	abs(cos(pi())) as �������_��,
	abs(sin(pi())) as �����_��,
	abs(tan(pi())) as �������_��,
	abs(cot(pi())) as ���������_��

/* 9 */
select 
	round(123.456, 3) as ���3,
	round(123.456, 2) as ���2,
	round(123.456, 1) as ���1,
	round(123.456, 0) as ���0,
	round(123.456, -1) as ���_1,
	round(123.456, -2) as ���_2,
	round(123.456, -3) as ���_3

/* 10 */
select 
	ceiling(123.456) as ������,
	floor(123.456) as ������

/* 11 */
select
	sqrt(25) as ������,
	square(25) as �������,
	power(25, 3) as ���

/* 12 */
select 
	getdate() as ������

/* 13 */
select
	day(getdate()) as ����,
	month(getdate()) as �����,
	year(getdate()) as ���,
	datepart(hour, getdate()) as ���,
	datepart(minute, getdate()) as ������,
	datepart(SECOND, getdate()) as �������,
	datepart(quarter, getdate()) as �������,
	datepart(week, getdate()) as ������,
	datepart(DAYOFYEAR, getdate()) as ����_����,
	datepart(WEEKday, getdate()) as ����_������

/* 14 */
select
	dateadd(day, -100, getdate()) as ����_100_�����

/* 15 */
select
	datediff(day, '18950708', '19710412') as ����������_��������_����

/* 16 */
select
	fio,
	case month(Date)
		when 3 then '�����'
		when 4 then '�����'
		when 5 then '�����'
		when 6 then '����'
		when 7 then '����'
		when 8 then '����'
		when 9 then '�����'
		when 10 then '�����'
		when 11 then '�����'
		else
			'����'
		end as �������_����
from student1

/* 17 */
select
	fio,
	Date,
	Specialization,
	Year,
	iif(Year - Year(Date) <= 18, '�������', '������')
	as �������_���_�����������
from
	Student1

/* 18 */
select
	fio,
	date,
	case
		when(month(date) = 3 and day(date) >= 21) or
		(month(date) = 4 and day(date) <= 20) then '����'
		when(month(date) = 4 and day(date) >= 21) or
		(month(date) = 5 and day(date) <= 21) then '�����'
		when(month(date) = 5 and day(date) >= 22) or
		(month(date) = 6 and day(date) <= 22) then '��������'
		when(month(date) = 6 and day(date) >= 22) or
		(month(date) = 7 and day(date) <= 22) then '���'
		when(month(date) = 7 and day(date) >= 23) or
		(month(date) = 8 and day(date) <= 21) then '���'
		when(month(date) = 8 and day(date) >= 22) or
		(month(date) = 9 and day(date) <= 23) then '����'
		when(month(date) = 9 and day(date) >= 24) or
		(month(date) = 10 and day(date) <= 23) then '����'
		when(month(date) = 10 and day(date) >= 24) or
		(month(date) = 11 and day(date) <= 22) then '��������'
		when(month(date) = 11 and day(date) >= 23) or
		(month(date) = 12 and day(date) <= 22) then '�������'
		when(month(date) = 12 and day(date) >= 23) or
		(month(date) = 1 and day(date) <= 20) then '�������'
		when(month(date) = 1 and day(date) >= 21) or
		(month(date) = 2 and day(date) <= 19) then '�������'
		when(month(date) = 2 and day(date) >= 20) or
		(month(date) = 3 and day(date) <= 20) then '����'
		end as ����_�������
from 
	Student1