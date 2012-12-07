function [ ret ] = g_1( a, C )
%G_1 inequality constraints
% 0 <= ai
% 0 <= C - ai
    ret = [ a ; C - a ];
end