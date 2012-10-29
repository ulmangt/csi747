function [ lambda ] = dg_1( x )
%DG_1 gradient vectors of constraints
    lambda = [ 2 * x(1) , 2 * x(2) ];
end