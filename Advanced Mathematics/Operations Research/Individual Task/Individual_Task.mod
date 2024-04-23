set Products;
set Resources;

param ResourceConsumption{Products, Resources};
param ResourceAvailability{Resources};
param ProductPrice{Products};

var Quantity{j in Products} >= 0;

maximize TotalRevenue: sum {p in Products} ProductPrice[p] * Quantity[p];

subject to ResourceConstraint{r in Resources}:
    sum {p in Products} ResourceConsumption[p, r] * Quantity[p] <= ResourceAvailability[r];