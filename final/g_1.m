function [ ret ] = g_1( a )
%G_1 inequality constraints
% 0 <= ai
% 0 <= C - ai
    ret = [ a ; C - a ];
end