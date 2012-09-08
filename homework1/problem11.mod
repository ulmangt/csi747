reset;

option display_precision 6 ;

model;

# define pi
param pi = 4 * atan(1);

param n;
param R;

var x {1..n} ;
var y {1..n} ;
var z {1..n} ;

minimize obj: sum { i in 1..n } ( sum { j in (i+1)..n} ( 1.0 / ( sqrt( (x[i]-x[j])^2+(y[i]-y[j])^2+(z[i]-z[j])^2 ) ) ) );

s.t. c1{i in 1..n} : x[i]^2 + y[i]^2 + z[i]^2 <= R^2  ;

data;

param n := 20;
param R := 1;

option solver loqo;

option loqo_options "iterlim=5000";

# initially place electrons evenly spaced around the unit circle
# on the plane y = z = 0
for {i in 1..n} {
  let x[i] := R * cos( i * ( 2.0 * pi / n ) + 0.1 ) ;
  let y[i] := 0 ;
  let z[i] := 0 ;
}

solve;

# human readable output
for {i in 1..n} {
  printf "(%f, %f, %f)\n", x[i], y[i], z[i] ;
}

# output for GNU plot
for {i in 1..n} {
  printf "%f, %f, %f\n", x[i], y[i], z[i] ;
}

# show distances from origin
for {i in 1..n} {
  printf "%d distance from origin: %f\n", i, sqrt( x[i]^2 + y[i]^2 + z[i]^2 ) ;
}

