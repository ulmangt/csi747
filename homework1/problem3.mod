reset;

model;

var x {1..2} ;

minimize obj: x[2] + 0.00001 * ( x[2] - x[1] ) ^ 2 ;

s.t. c1: x[2] >= 0 ;

option solver loqo;

solve;

display x;
