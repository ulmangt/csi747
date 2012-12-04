function [ alpha ] = hc_1( a, i )
%HC_1 hessian of equality constraints
% sum( a * y ) = 0
% hessian is zero vector for any i
    alpha = zeros( size( a ) );
end
