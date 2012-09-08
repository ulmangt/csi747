reset;

option display_precision 6 ;

model;

var x {1..2} ;

# the objective is arbitrary here because we simply
# seek any x satisfying the constraints
# here we choose to maximise x[1]
maximize obj: x[1] ;

s.t. c1 : x[1]^2 + x[2]^2 = 25 ;
s.t. c2 : x[1] * x[2] = 9 ;

option solver loqo;

solve;

display x;
