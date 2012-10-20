function [ xs iter steps ] = constrained_newton( f, df, hf, g, dg, guess )
%CONSTRAINED_NEWTON Find minimum value of func subject to constraints
% f: function to minimize
% df: gradient of f
% hf: hessian of h
% g: constraints
% dg: gradient of g

% initial values for primal variable
x = guess;

% evaluate function and constraints at x
g_x  =  g( x )
dg_x = dg( x )
f_x  =  f( x )
df_x = df( x )
hf_x = hf( x )

% number of constraints / dual variables
dg_x_size = size( dg_x )
nc = dg_x_size(1)

% number of primal variables
np = length( x )

% initial values for dual variable
y = zeros( nc, 1 )

% build left hand side matrix
lhs = [ hf_x, -dg_x' ; dg_x, zeros( nc ) ] 

% build right hand side vector
rhs = [ -df_x' + dg_x' * y ; -g_x ]


end
