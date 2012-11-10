reset;

model;

var x {1..5} ;

minimize obj: x[1] + x[2]^2 + x[3] + x[4] + x[5]^4 ;

s.t. c1: x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 <= 9 ;

s.t. c2: x[1] + 2*x[2] + 2*x[3] + 4*x[4] = 1;

s.t. c3: 2*x[3] - 4*x[4] = 1;

s.t. c4: x[1]^2 - x[5] <= 2;

s.t. c5: x[4] >= 0.5;

option solver loqo;

solve;

display x;
