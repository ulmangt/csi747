function [ ret ] = c_1( a, C )
%C_1 equality constraints
% sum( a * y ) = 0
    ret = [ a ; C - a ];
end
