function [ lambda ] = c_2( x )
%C_2 constraints of function to minimize
    lambda = [ -x(1)^2 - x(2)^2 - x(3)^2 - x(4)^2 +        9    ;
               -x(1)^2 +                            x(5) + 2    ;
                                           x(4)          - 0.5 ];
end
