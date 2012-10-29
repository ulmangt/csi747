function [ lambda ] = g_1( x )
%G_1 constraints of function to minimize
    lambda = [ -x(1)^2 - x(2)^2 + 25 ];
end