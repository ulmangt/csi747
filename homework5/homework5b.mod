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
var z {j in 0..n} = 0.1 * ( x[j]^2 + y[j]^2 )


minimize final_velocity: 

s.t. initial_position_x: x[0] = x0;
s.t. initial_position_y: y[0] = y0;
s.t. final_position_x: x[n] = xf;
s.t. final_position_y: y[n] = yf;


