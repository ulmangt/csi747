reset;

model;

set MEDIA; #types of advertising media

param cost {MEDIA} >= 0;
param reach {MEDIA} >= 0;
param mintime {MEDIA} >= 0;
param person_day {MEDIA} >= 0;

param budget;
param personell;

var time {MEDIA};

maximize audience: sum {m in MEDIA} ( reach[m] * time[m]  );

# time commitment
s.t. time_limit {m in MEDIA}: time[m] >= mintime[m];

# budget limit
s.t. budget_limit: sum {m in MEDIA} ( time[m] * cost[m] ) <= budget;

# personell limit
s.t. personell_limit: sum {m in MEDIA} ( time[m] * person_day[m] ) <= personell;

data;

set MEDIA := tv mag radio;

### values assume 1 person-week = 5 person-days ###

param budget := 1000000;
param personell := 500;

param:     cost     reach    person_day  mintime :=
  tv      20000   1800000             5       10
  mag     10000   1000000            15        0
  radio    2000    250000             1        0 ;

option solver loqo;

option loqo_options "iterlim=5000";

solve;

display audience;
display time.lb, time, time.ub, time.rc;
