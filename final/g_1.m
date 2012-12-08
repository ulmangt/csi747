function [ ret ] = g_1( a, y )
%G_1 inequality constraints
% 0 <= ai
% 0 <= C - ai
    ret = dot( a, y );
end
