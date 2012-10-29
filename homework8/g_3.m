function [ lambda ] = g_3( x )
%G_3 constraints of function to minimize
    lambda = [ -x(1)^2 - x(2)^2 - x(3)^2 - x(4)^2 + 4, x(1) + x(2) + 2*x(3) + 3*x(4) - 1 ];
end