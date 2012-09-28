reset;

model;

param g  := 32.174; # in ft/s^2 
param Tmax  := 200; #maximum thrust capable of rocket 
param sigma := 5.4915e-5; #air resistance parameter 
param c  := 1580.9425; #thrust coeff 
param d  := 23800; #air density adjustment parameter 
param m0 := 3; #initial mass (measured in units) 
param mempty := 0.01;# mass of the rocket without the fuel

# discretization
param n := 70;

# final moment of time
var tf >= 80, <=220, := 200;

# height of rocket
var h {j in 0..n} >= 0;

# velocity of rocket
var v {j in 1..n} = ( h[j] - h[j-1] ) / ( tf / n );

# average velocity at h[1] through h[n-1]
var v_avg {j in 1..n-1} = ( v[j] + v[j+1] ) / 2;

# acceleration of rocket
var a {j in 1..n-1} = ( v[j+1] - v[j] ) / ( tf / n );

# thrust of rocket
var T {j in 0..n} >= 0, <= Tmax;

# mass of rocket
var m {j in 0..n} >= mempty, <= m0;

# derivative of mass with respect to time
var d_m {j in 1..n} = ( m[j] - m[j-1] ) / ( tf / n );

# average derivative of mass at m[1] through m[n-1]
#var d_m_avg {j in 1..n-1} = ( d_m[j] + d_m[j+1] ) / 2;

# air resistance acting against rocket
var R {j in 0..n};

# maximize the final altitude of the rocket
maximize altitude: h[n];

# constrained by Newton's second law (F=MA)
s.t. newton {j in 1..n-1}: m[j] * a[j] = T[j] - R[j] - m[j] * g;

# where air reistance is defined as follows
s.t. air_resistance {j in 1..n-1}: R[j] = sigma * ( v_avg[j] )^2 * exp( -h[j] / d );

# trust of the rocket is proportional to the amount of fuel being burned
s.t. thrust {j in 1..n-1}: T[j] = -c * d_m[j];

# initial conditions
s.t. initial_height: h[0] = 0;
s.t. initial_velocity: v[1] = 0;
s.t. initial_mass: m[0] = m0;

option solver loqo;

solve;

display a;
display v;
display h;
display m;
display T;
display R;
display tf;
display altitude;

printf "# time height velocity acceleration mass thrust air_resistance\n";
for {j in 1..n-1} {
  printf "%f %f %f %f %f %f %f\n", ( tf / n ) * j, h[j], v_avg[j], a[j], m[j], T[j], R[j] ;
}

