
% run gradient method and plot series of intermediate points

[xs iterations steps] = gradient( @func_1, @grad_hessian_func_1, [1 1]', 0.001, 0.5 );
plotSteps( @func_1, -2:0.05:1, -1:0.05:1, steps );
xs

% run newton's method and plot series of intermediate points

figure(2)
[xs iterations steps] = newton( @func_1, @grad_hessian_func_1, [1 1]', 0.001, 0.5 );
plotSteps( @func_1, -2:0.05:1, -1:0.05:1, steps );
xs