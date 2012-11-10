reset;

model;

var x {1..4} ;

minimize obj: 3*x[1] + 2*x[2] + x[3] + x[4] ;

s.t. c1: x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 <= 10 ;

s.t. c2: x[1] + x[2] + 2*x[3] + 3*x[4] = 1;

s.t. c3: x[1] >= 1;

option solver loqo;

solve;

display x;
