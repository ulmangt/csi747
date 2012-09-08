reset;

model;

var x {1..2} ;

minimize obj: ( 1 - x[1] )^2 ;

s.t. c1 : 10 * ( x[2] - x[1]^2 ) = 0 ;

option solver loqo;

solve;

display x;
