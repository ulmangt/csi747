function [ lambda ] = dg_2( x )
%DG_2 gradient vectors of constraints
    lambda = [ 6 * x(1) , 2 * x(2) ];
end
