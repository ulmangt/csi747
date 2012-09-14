reset;

model;

set MACHINE;
set PART;

param required {PART} >= 0;
param capacity {MACHINE} >= 0;

param cost {MACHINE,PART} >= 0;
param time {MACHINE,PART} >= 0;

var plan {MACHINE,PART} >= 0;

minimize total_time: sum {p in PART,m in MACHINE} ( time[m,p] * plan[m,p] );

s.t. required_production {p in PART}: sum {m in MACHINE} plan[m,p] >= required[p];

s.t. available_capacity {m in MACHINE}: sum {p in PART} plan[m,p] * time[m,p] <= capacity[m];

data;

set PART := 1 2 3 4 5 6 ;
set MACHINE := 1 2 3 ;

param cost :
   1 2 3 4 5 6 :=
 1 3 3 2 5 2 1
 2 4 1 1 2 2 1
 3 2 2 5 1 1 2 ;

param time :
     1   2   3   4   5   6 :=
 1 1.3 1.3 1.2 1.5 1.2 1.1
 2 1.4 1.1 1.1 1.2 1.2 1.1
 3 1.2 1.2 1.5 1.1 1.1 1.2 ;

param capacity :=
 1            50
 2            90
 3           175 ;

param required :=
 1            10
 2            40
 3            60 
 4            20
 5            20
 6            30 ;

option solver minos;

solve;

display required_production.lb,required_production.body,required_production.ub;
display available_capacity.lb,available_capacity.body,available_capacity.ub;
display total_time;
display plan;
