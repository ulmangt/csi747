reset;

model;

# first fixed point
param xa;
param ya;

# second fixed point
param xb;
param yb;

# length of chain
param L;

# discretization
param N;

# mass (default mass of each section)
param m {1..N-1}, default 1.0 / ( N - 1 );

# gravity
param g, default 1;

# position of chain
var x {0..N};
var y {0..N};

minimize energy: sum {j in 1..N-1} ( m[j] * g * y[j] ) ;

s.t. link {j in 1..N} : ( ( x[j] - x[j-1] )^2 + ( y[j] - y[j-1] )^2 ) <= ( L / N )^2 ;

s.t. xleftfixed : x[0] = xa ;
s.t. yleftfixed : y[0] = ya ;
s.t. xrightfixed : x[N] = xb ;
s.t. yrightfixed : y[N] = yb ;


data;

param xa := 0 ;
param ya := 0 ;

param xb := 4 ;
param yb := 0 ;

param L := 7 ;
param N := 150 ;

# mass of the link in the center of the chain
# is the normal mass of the link PLUS 1 lb
let m[N/2] := 1.0 + 1.0 / ( N - 1 ) ;

option solver loqo;
option solver_msg 0;
option loqo_options "iterlim=5000";

solve;

# output for GNU plot
for {j in 0..N} {
  printf "%f, %f\n", x[j], y[j] ;
}

