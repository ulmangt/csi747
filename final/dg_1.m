function [ alpha ] = dg_1( a )
%DG_1 gradient of inequality constraints
% 0 <= ai
% 0 <= C - ai
    alpha = [ eye( size(a) ) ; -eye( size( a ) ) ];
end