/* 15 */
select brand, sum(cost) as [Стоитмость всех машин бренда]
from Cars
group by
	rollup(brand);

/* 16 */
select brand, colour, count(brand) as [Количество машин]
from Cars
group by
	cube(colour, brand);