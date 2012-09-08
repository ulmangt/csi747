reset;

model;

# first fixed point
param ax;
param ay;

# second fixed point
param bx;
param by;

# discretization
param N;

# step size in x
param dx = ( bx - ax ) / N

# y (height) at fixed x points
var y {0..N};

# y' (derivative) at fixed x points
var yp {0..N};

minimize energy: sum {j in 1..N} ( ( ( ( y[j-1]*sqrt(1+yp[j-1]^2) ) + ( y[j]*sqrt(1+yp[j]^2 ) ) ) / 2.0 ) * ( x[j] - x[j-1] ) ) ;

s.t. length {j in 0..N} : sqrt( 1 + yp[j]^2 ) * dx = 1 ;

s.t. leftfixed : y[0] = ay ;
s.t. rightfixed : y[N] = by ;
