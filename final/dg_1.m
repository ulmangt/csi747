function [ ret ] = dg_1( a, y )
%DG_1 gradient of inequality constraints
% 0 <= ai
% 0 <= C - ai
    ret = y';
end
