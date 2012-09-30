reset;

model;

# mass of golf ball
param m := 0.01;

# surface normal coefficient
param mu := 0.25;

# initial position of ball
param x0 := 1;
param y0 := 2;

# position of cup
param xf := 1;
param yf := -2;

# discretization factor
param n := 50;

# final moment of time
var tf >= 0, <=30, := 3;

# x coordinate of the ball
var x {j in 0..n};

# y coordinate of the ball
var y {j in 0..n};

# z coordinate of ball is determined by shape of putting green
var z {j in 0..n} = 0.1 * ( x[j]^2 + y[j]^2 );

# x coordinate of velocity
var vx {j in 1..n} = ( x[j] - x[j-1] ) / ( tf / n );

# y coordinate of velocity
var vy {j in 1..n} = ( y[j] - y[j-1] ) / ( tf / n );

# x average velocity at x[1] through x[n-1]
var vx_avg {j in 1..n-1} = ( vx[j] + vx[j+1] ) / 2;

# y average velocity at y[1] through y[n-1]
var vy_avg {j in 1..n-1} = ( vy[j] + vy[j+1] ) / 2;

# x coordinate of acceleration
var ax {j in 1..n-1} = ( vx[j+1] - vx[j] ) / ( tf / n );

# y coordinate of acceleration
var ay {j in 1..n-1} = ( vy[j+1] - vy[j] ) / ( tf / n );

minimize final_velocity: 

s.t. initial_position_x: x[0] = x0;
s.t. initial_position_y: y[0] = y0;
s.t. final_position_x: x[n] = xf;
s.t. final_position_y: y[n] = yf;

s.t. bounding_box {j in 0..n}: 4 * x[j] + y[j] <= 16;
