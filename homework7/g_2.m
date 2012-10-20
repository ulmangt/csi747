function [ lambda ] = g_2( x )
%G_1 constraints of function to minimize
    lambda = [ 3 * x(1)^2 + x(2)^2 - 9 ];
end