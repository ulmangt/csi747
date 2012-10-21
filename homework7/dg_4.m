function [ lambda ] = dg_4( x )
%DG_4 gradient vectors of constraints
    lambda = [ 2*x(1), 2*x(2), 2*x(3), 2*x(4) ];
end