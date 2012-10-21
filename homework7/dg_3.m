function [ lambda ] = dg_3( x )
%DG_3 gradient vectors of constraints
    lambda = [ 2*x(1), 2*x(2), 2*x(3), 2*x(4)  ;
                    1,      1,      2,      3 ];
end