function [ alpha ] = c_1( a, y )
%C_1 equality constraints
% sum( a * y ) = 0
    alpha = [ dot( a, y ) ];
end