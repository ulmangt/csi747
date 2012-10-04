function [ grad, hessian ] = grad_hessian_func_1( x )
    grad = [ 20*x(1)^3 - 12*x(1) + 2*x(2) + 15 ; 24*x(2)^3 + 2*x(1) + 10*x(2) - 7 ];
    hessian = [ [ 60*x(1)^2 - 12 , 2 ]
                [ 2 , 72*x(2)^2 + 10 ] ];
end