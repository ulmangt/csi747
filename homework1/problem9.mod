reset;

option display_precision 6 ;

model;

# define pi
param pi = 4 * atan(1);

var x {1..2} ;

minimize obj: sin( ( pi * x[1] ) / 12 ) * cos( ( pi * x[2] ) / 16 ) ;

s.t. c1 : 4 * x[1] - 3 * x[2] = 0 ;

option solver loqo;

solve;

display x;
