reset;

model;

var x {1..2} ;

minimize obj: ( ( x[1] + 1 )^3 ) / 3 + x[2] ;

s.t. c1 : x[1] >= 1 ;
s.t. c2 : x[2] >= 0 ;

option solver loqo;

solve;

display x;
