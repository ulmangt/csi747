function [ lambda ] = hg_1( x, i )
%HG_1 hessian matrix of constraints
    lambda = [ -2 , 0 ;
               0 , -2 ];
end