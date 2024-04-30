/* 1 */
select
		'����������' as [���������� �������� �� ���������],
		����������,
		������,
		�����
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
			for predmet in(����������, ������, �����)
		) as PIVOT_TABLE

/* 2 */
select
		ush,
		����������,
		������,
		�����
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
			for predmet in(����������, ������, �����)
		) as PIVOT_TABLE

/* 3 */
select
		fio, [������� ��� �����]
from Tablica
unpivot(
		[������� ��� �����] for �������� in(ush, predmet)) unpvt

/* 4 */
select
		'������� ����' as [������� ���� �������� �� ������],
		��������,
		�����
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
			for ush in(��������, �����, �����)
		) as PIVOT_TABLE

/* 5 */
select
		predmet,
		��������,
		�����
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
			for ush in(��������, �����, �����)
		) as PIVOT_TABLE

/* 6 */
select
		[������� ��� ������� ��� �����]
from Tablica
unpivot(
		[������� ��� ������� ��� �����] for 
		�������� in(predmet, fio, ush)) unpvt