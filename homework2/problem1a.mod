reset;

model;

# first fixed point
param ax;
param ay;

# second fixed point
param bx;
param by;

# length of chain
param L;

# discretization
param N;

# step size in x
param dx = ( bx - ax ) / N;

# y (height) at fixed x points
var y {0..N};

# y' (derivative) at fixed x points
var yp {0..N};

minimize energy: sum {j in 1..N} ( ( ( ( y[j-1]*sqrt(1+yp[j-1]^2) ) + ( y[j]*sqrt(1+yp[j]^2 ) ) ) / 2.0 ) * ( x[j] - x[j-1] ) ) ;

s.t. deriv {j in 1..N} : y[j] = ( ( yp[j] + yp[j-1] ) / 2.0 ) * dx + y[j-1]
s.t. length : sum {j in 0..N} sqrt( 1 + yp[j]^2 ) * dx = L ;

s.t. leftfixed : y[0] = ay ;
s.t. rightfixed : y[N] = by ;


data;

param ax := 0 ;
param ay := 0 ;

param bx := 4 ;
param by := 2 ;

param L := 7 ;
param N := 20 ;

option solver loqo;

option loqo_options "iterlim=5000";

solve;

# output for GNU plot
for {j in 0..N} {
  printf "%f, %f, %f\n", ax + dx * j, y[j], yp[j] ;
}

