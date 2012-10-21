reset;

model;

var x {1..4} ;

minimize obj: 3*x[1]^3 + 2*x[2]^3 + x[3]^3 + x[4]^3 ;

s.t. c1: x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 = 4 ;

s.t. c2: x[1] + x[2] + 2*x[3] + 3*x[4] = 1;

option solver loqo;

solve;

display x;
