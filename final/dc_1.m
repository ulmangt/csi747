function [ ret ] = dc_1( a )
%DC_1 gradient of equality constraints
% sum( a * y ) = 0
    ret = [ eye( length(a) ) ; -eye( length( a ) ) ];
end
