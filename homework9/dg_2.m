function [ lambda ] = dg_2( x )
%DG_2 gradient vectors of constraints
    lambda = [ -2*x(1), -2*x(2), -2*x(3), -2*x(4),  0   ;
               -2*x(1),       0,       0,       0,  1   ;
                     0,       0,       0,       1,  0  ];
end