function [ ret ] = gc_1( a, y )
%GC_1 gradient of equality constraints
% sum( a * y ) = 0
    ret = [ y' ];
end