function [ alpha ] = hg_1( a, i )
%HG_1 hessian of inequality constraints
% 0 <= ai
% 0 <= C - ai
% hessian is zero vector for any i
    alpha = zeros( size( a ) );
end