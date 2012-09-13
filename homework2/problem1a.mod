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
param N ;

# step size in x
param dx = ( xb - xa ) /  N ;

# y (height) at fixed x points
var y {0..N};

# y' (derivative) at fixed x points
var yp {0..N};

minimize energy: sum {j in 1..N} ( ( ( ( y[j-1]*sqrt(1+yp[j-1]^2) ) + ( y[j]*sqrt(1+yp[j]^2 ) ) ) / 2.0 ) * dx ) ;

s.t. deriv {j in 1..N} : y[j] = ( ( yp[j] + yp[j-1] ) / 2.0 ) * dx + y[j-1] ;
s.t. length : sum {j in 0..N} sqrt( 1 + ( yp[j] )^2 ) * dx = L ;

s.t. leftfixed : y[0] = ya ;
s.t. rightfixed : y[N] = yb ;

# I think there may need to be additional constraints on yp[0]
# and yp[N] because they have only one "deriv" constraint each
# instead of two at the other points. I'm not sure what it
# should be, however

data;

param xa := 0 ;
param ya := 0 ;

param xb := 4 ;
param yb := 2 ;

param L := 7 ;
param N := 150 ;

option solver loqo;

option loqo_options "iterlim=5000";

solve;

# output for GNU plot
for {j in 0..N} {
  printf "%f, %f, %f\n", xa + dx * j, y[j], yp[j] ;
}

