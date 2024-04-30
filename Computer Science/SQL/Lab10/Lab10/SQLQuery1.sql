/* 1 */
select 
	*, len(fio) as �����
from Student1
order by
	len(fio)

/* 2 */
select
	trim(fio) as ���,
	date,
	Specialization,
	Year
from 
	student1

/* 3 */
select 
	fio,
	charindex('ov', fio) as �������_��
from
	Student1

/* 4 */
select
	fio,
	right(specialization, 2) as ���������_2
from 
	student1

/* 6 */
select distinct
	specialization,
	reverse(specialization) as ��������
from
	Student1

/* 7 */
select
	replicate('Karpovich', 9) as �������

/* 8 */
select
	abs(round(square(sin(pi()/2)) - cos(3*pi()/2), 2))

/* 9 */
select
	datediff(day, getdate(), '20230630') as ����������

/* 10 */
select
	datediff(day, '20040823', getdate())/30 as ����������_��������_�������

/* 11 */
select distinct
	specialization,
	case
		when(len(specialization) > 7) then '�������'
		else '��������'
		end as ����
from
	Student1
