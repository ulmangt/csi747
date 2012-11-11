function [ lambda ] = g_1( x )
%G_1 constraints of function to minimize
    lambda = [ x(1) + x(2) + 2*x(3) + 3*x(4) - 1 ];
end
