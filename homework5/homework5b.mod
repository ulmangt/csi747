reset;

model;

# gravitational force in ft/s^2 
param g  := 32.174;

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

# position of ball
var x {j in 0..n};
var y {j in 0..n};
var z {j in 0..n} = 0.1 * ( x[j]^2 + y[j]^2 );

# derivative with respect to time of ball position
var dx {j in 0..n} = 0.2 * x[j];
var dy {j in 0..n} = 0.2 * y[j];

# velocity of ball
var vx {j in 1..n} = ( x[j] - x[j-1] ) / ( tf / n );
var vy {j in 1..n} = ( y[j] - y[j-1] ) / ( tf / n );
var vz {j in 1..n} = ( z[j] - z[j-1] ) / ( tf / n );

# average velocity at x[1] through x[n-1]
var vx_avg {j in 1..n-1} = ( vx[j] + vx[j+1] ) / 2;
var vy_avg {j in 1..n-1} = ( vy[j] + vy[j+1] ) / 2;
var vz_avg {j in 1..n-1} = ( vz[j] + vz[j+1] ) / 2;

# norm of velocity (speed)
var v_avg_norm {j in 1..n-1} = sqrt( vx_avg[j]^2 + vy_avg[j]^2 + vz_avg[j]^2 );

# acceleration of ball
var ax {j in 1..n-1} = ( vx[j+1] - vx[j] ) / ( tf / n );
var ay {j in 1..n-1} = ( vy[j+1] - vy[j] ) / ( tf / n );
var az {j in 1..n-1} = ( vz[j+1] - vz[j] ) / ( tf / n );

# unit normal vector
var norm_n_sq {j in 0..n} = dx[j]^2 + dy[j]^2 + 1;

# normal force
var Nz {j in 1..n-1} = m * ( ( g - ax[j] * dx[j] - ay[j] * dy[j] + az[j] ) / ( norm_n_sq[j]^2 ) )
var Nx {j in 1..n-1} = -dx[j] * Nz[j];
var Ny {j in 1..n-1} = -dy[j] * Nz[j];

minimize final_velocity: 

s.t. initial_position_x: x[0] = x0;
s.t. initial_position_y: y[0] = y0;
s.t. final_position_x: x[n] = xf;
s.t. final_position_y: y[n] = yf;

s.t. bounding_box {j in 0..n}: 4 * x[j] + y[j] <= 16;
