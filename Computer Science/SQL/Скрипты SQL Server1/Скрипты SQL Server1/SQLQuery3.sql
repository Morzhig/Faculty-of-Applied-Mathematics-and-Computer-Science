use CarRentalDB;

/* Полная стоимость марки */
select brand, sum(cost) as overall
from Cars
group by 
rollup(brand);

/*  */
select cost, colour, count(brand) as kolcar
from Cars
group by
	cube(colour, cost);