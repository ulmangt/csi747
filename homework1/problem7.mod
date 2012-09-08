reset;

model;

var x {1..2} ;

maximize obj: x[2] - log( x[1]^2 + 1 ) ;

s.t. c1 : ( x[1]^2 + 1 )^2 + x[2]^2 = 4 ;

option solver loqo;

solve;

display x;
