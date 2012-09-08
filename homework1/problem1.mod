reset;

model;

var x {1..2} ;

minimize obj: 100 * ( x[2] - x[1] ^ 2 ) ^ 2 + (  1 - x[1] ) ^ 2 ;

s.t. c1: x[2] >= -1.5 ;

option solver loqo;

solve;

display x;
