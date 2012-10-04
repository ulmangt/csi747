function [ xs iter steps ] = gradient( func, grad_hessian_func, guess, epsilon, eta )
%GRADIENT Find minimum value of func

    % if no epsilon was provided, set a default
    if nargin < 4
        epsilon = 0.001;
    end

    % if no eta was provided, set a default
    if nargin < 5
        eta = 0.2;
    end
    
    % set the current solution to the initial guess
    xs = guess;
    
    % dimension of func domain
    dim = length( xs );
    
    % evaluate the function, gradient, and hessian at x_s
    [grad hessian] = grad_hessian_func( xs );
    fsx = func( xs );
    
    % iteration counter
    iter = 1;
    
    % store steps
    steps = xs;
    
    while norm( grad ) >= epsilon

        % step direction is negative gradient
        dxs = -grad;
        
        % initial value of step size
        as = 1.0;
        
        % decrease step size until a sufficient decrease in function
        % value is achieved (how much is sufficient is controlled by eta
        while func( xs + as * dxs ) - fsx >= eta * as * grad' * dxs
           as = as / 2.0; 
        end
        
        % update guess
        xs = xs + as * dxs;
        
        % store each step
        steps = [steps xs];
        
        % evaluate the function, gradient, and hessian at x_s
        [grad hessian] = grad_hessian_func( xs );
        fsx = func( xs );
        
        % update iteration counter and output status
        iter = iter + 1;
        str = sprintf( 'Iteration: %d F(x): %f Gradient: %f as: %f\n', iter, fsx, norm( grad ), as );
        disp( str );
    end
end

