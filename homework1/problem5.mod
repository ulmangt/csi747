reset;

model;

var x {1..2} ;

minimize obj: sin( x[1] + x[2] ) + ( x[1] - x[2] )^2 - 1.5 * x[1] + 2.5 * x[2] + 1 ;

s.t. c1 : -1.5 <= x[1] <= 4 ;
s.t. c2 : -3 <= x[2] <= 3 ;

option solver loqo;

solve;

display x;
