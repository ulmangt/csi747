[xs iterations steps] = gradient( @func_1, @grad_hessian_func_1, [1 1]', 0.001, 0.1 );
plotSteps( @func_1, -3:0.05:3, -3:0.05:3, steps );
figure(2)
[xs iterations steps] = newton( @func_1, @grad_hessian_func_1, [1 1]', 0.001, 0.1 );
plotSteps( @func_1, -3:0.05:3, -3:0.05:3, steps );