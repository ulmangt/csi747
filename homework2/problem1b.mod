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

# step size in x
param dx = ( xb - xa ) / N;

# y (height) at fixed x points
var y {0..N};

# y' (derivative) at fixed x points
var yp {1..N};

minimize energy: sum {j in 1..N} ( ( (  y[j] + y[j-1] ) / 2.0 ) * sqrt(1+yp[j]^2) * dx ) ;

s.t. deriv {j in 1..N} : y[j] = dx * yp[j] + y[j-1];
s.t. length : sum {j in 1..N} sqrt( 1 + yp[j]^2 ) * dx = L ;

s.t. leftfixed : y[0] = ya ;
s.t. rightfixed : y[N] = yb ;


data;

param xa := 0 ;
param ya := 0 ;

param xb := 4 ;
param yb := 2 ;

param L := 7 ;
param N := 100 ;

option solver loqo;

option loqo_options "iterlim=5000";

solve;

# output for GNU plot
for {j in 0..N} {
  if ( j == 0 ) then {
    printf "%f, %f, 0.0\n", xa + dx * j, y[j] ;
  }
  else {
    printf "%f, %f, %f\n", xa + dx * j, y[j], yp[j] ;
  }
}

