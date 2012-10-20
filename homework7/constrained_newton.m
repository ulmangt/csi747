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

% number of constraints
nc = length( g_x )

% initial values for dual variable
y = zeros( nc, 1 )

% build left hand side matrix
lhs = [ hf_x, -dg_x' ; dg_x, zeros( nc ) ] 

-df_x

dg_x' * y

-g_x

% build right hand side vector
rhs = [ -df_x + dg_x' * y , -g_x ]


end
