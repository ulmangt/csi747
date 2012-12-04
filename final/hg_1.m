function [ ret ] = hg_1( a, i )
%HG_1 hessian of inequality constraints
% 0 <= ai
% 0 <= C - ai
% hessian is zero vector for any i
    ret = zeros( size( a ) );
end