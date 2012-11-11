function [ lambda ] = g_2( x )
%G_2 constraints of function to minimize
    lambda = [ x(1) + 2*x(2) + 2*x(3) + 4*x(4) - 1 ;
                               2*x(3) - 4*x(4) - 1 ];
end


