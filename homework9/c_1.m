function [ lambda ] = c_1( x )
%C_1 constraints of function to minimize
    lambda = [ -x(1)^2 - x(2)^2 - x(3)^2 - x(4)^2 + 10 ;
                                              x(1) - 1 ];
end
