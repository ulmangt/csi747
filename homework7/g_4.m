% alternative to g_3 with only one constraint (for testing purposes)
function [ lambda ] = g_4( x )
%G_4 constraints of function to minimize
    lambda = [ x(1)^2 + x(2)^2 + x(3)^2 + x(4)^2 - 4 ];
end