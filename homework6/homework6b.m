[xs iterations steps] = gradient( @func_1, @grad_hessian_func_1, [1 1]', 0.001, 0.1 )

[xs iterations steps] = newton( @func_1, @grad_hessian_func_1, [1 1]', 0.001, 0.1 )