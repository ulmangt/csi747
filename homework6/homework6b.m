% function to be minimized
func = inline( '5*x(1)^4 + 6*x(2)^4 - 6*x(1)^2 + 2*x(1)*x(2) + 5*x(2)^2 + 15*x(1) - 7*x(2) + 13' );
grad_hessian_func = inline( '' );