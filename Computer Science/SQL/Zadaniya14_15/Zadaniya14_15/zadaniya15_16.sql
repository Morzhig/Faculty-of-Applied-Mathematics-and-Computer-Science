/* 15 */
select brand, sum(cost) as [���������� ���� ����� ������]
from Cars
group by
	rollup(brand);

/* 16 */
select brand, colour, count(brand) as [���������� �����]
from Cars
group by
	cube(colour, brand);