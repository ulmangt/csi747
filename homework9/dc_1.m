function [ lambda ] = dc_1( x )
%DC_1 gradient vectors of constraints
    lambda = [ -2*x(1), -2*x(2), -2*x(3), -2*x(4)  ;
                    1,      0,      0,      0 ];
end
