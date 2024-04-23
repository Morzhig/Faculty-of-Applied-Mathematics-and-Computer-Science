set Months ordered;
param Month{Months} symbolic;
param Demand{Months};
param Setup_Cost;
param Unit_Cost;
param Storage_Cost;
param Initial_Inventory;

var Production{Months} integer >= 0;
var Storage{Months} integer >= 0;
var Current_inventory{Months} integer;

minimize Total_Cost:
    sum{t in Months} (Setup_Cost + Unit_Cost * Production[t] + Storage_Cost * Storage[t]);

subject to Meet_Demand{t in Months}:
    Production[t] + Current_inventory[t] - Demand[t] = (if t > 1 then Demand[t-1] else 0);
    
subject to Inventory{t in Months}:
    Current_inventory[t] = Initial_Inventory + (if t > 1 then Production[t-1] else 0) - (if t > 1 then Demand[t-1] else 0) - Storage[t];