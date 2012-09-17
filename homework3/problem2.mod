reset;

model;

set FOOD; # types of food
set NUTR; # types of nutrients

param amount {NUTR,FOOD} >= 0;
param cost {FOOD} > 0;
param nutrient_min {NUTR} >= 0;

var lbs {FOOD} >= 0;

minimize total_cost: sum {f in FOOD,n in NUTR} ( lbs[f] * cost[f] );

# make sure we get enough of each nutrient
s.t. enough_nutrients {n in NUTR}: sum {f in FOOD} ( amount[n,f] * lbs[f] ) >= nutrient_min[n] ;


data;

set FOOD := bread meat potato cabbage milk gelatin;
set NUTR := calories protein calcium vitamin_a;

param amount:   
                    bread    meat    potato    cabbage    milk    gelatin :=
  calories           1254    1457       318         46     309       1725
  protein              39      73         8          4      16         43
  calcium             418      41        42        141     536          0
  vitamin_a             0       0        70        860     720          0 ;

param:        cost :=
  bread       0.30
  meat        1.00
  potato      0.05
  cabbage     0.08
  milk        0.23
  gelatin     0.48 ;

param:       nutrient_min :=
  calories           3000
  protein              70
  calcium             800
  vitamin_a           500 ;

option solver minos;

solve;

display enough_nutrients.lb,enough_nutrients.body,enough_nutrients.ub;
display total_cost;
display lbs;
