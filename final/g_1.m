function [ alpha ] = g_1( a )
%G_1 inequality constraints
% 0 <= ai
% 0 <= C - ai
    alpha = [ a ; C - a ];
end