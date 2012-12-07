function [ ret ] = c_1( a, y )
%C_1 equality constraints
% sum( a * y ) = 0
    ret = dot( a, y );
end