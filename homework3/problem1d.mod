reset;

model;

set MEDIA; #types of advertising media

param cost {MEDIA} >= 0;
param reach {MEDIA} >= 0;
param min_time {MEDIA} >= 0;
param max_time {MEDIA} >= 0;
param person_day {MEDIA} >= 0;

param budget;
param personell;

var time {MEDIA};

maximize audience: sum {m in MEDIA} ( reach[m] * time[m]  );

# time commitment
s.t. min_time_limit {m in MEDIA}: time[m] >= min_time[m];
s.t. max_time_limit {m in MEDIA}: time[m] <= max_time[m];

# budget limit
s.t. budget_limit: sum {m in MEDIA} ( time[m] * cost[m] ) <= budget;

# personell limit
s.t. personell_limit: sum {m in MEDIA} ( time[m] * person_day[m] ) <= personell;

data;

set MEDIA := tv mag radio;

### values assume 1 person-week = 5 person-days ###

param budget := 1000000;
param personell := 500;

param:     cost     reach    person_day  min_time     max_time :=
  tv      20000   1800000             5       10      Infinity
  mag     10000   1000000            15        2      Infinity
  radio    2000    250000             1        0           120 ;

option solver minos;

solve;

display audience;
display time.lb, time, time.ub, time.rc;
