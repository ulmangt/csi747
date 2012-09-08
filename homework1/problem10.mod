reset;

option display_precision 6 ;

model;

var x {1..2} ;

maximize obj: x[2] - x[1] ;

s.t. c1 : -3 * x[1]^2 + 2 * x[1] * x[2] - x[2]^2 >= -1 ;

option solver loqo;

solve;

display x;
