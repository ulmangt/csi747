reset;

model;

set MEDIA; #types of advertising media

param cost {MEDIA} >= 0;
param reach {MEDIA} >= 0;
param mintime {MEDIA} >= 0;

param budget;

var time {MEDIA};

maximize audience: sum {m in MEDIA} ( reach[m] * time[m]  );

# time commitment
s.t. time_limit {m in MEDIA}: time[m] >= mintime[m];

# budget limit
s.t. budget_limit: sum {m in MEDIA} ( time[m] * cost[m] ) <= budget;

data;

set MEDIA := tv mag;

param budget := 1000000;

param:     cost     reach    mintime :=
  tv      20000   1800000         10
  mag     10000   1000000          0 ;

option solver loqo;

option loqo_options "iterlim=5000";

solve;

display audience;
display time;
