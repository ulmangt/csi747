function [ xs iter ] = newton( func, grad_hessian_func, guess, epsilon, eta )
%NEWTON Find minimum value of func
%   Detailed explanation goes here

    % if no epsilon was provided, set a default
    if nargs < 4
        epsilon = 0.0001;
    end

    % if no eta was provided, set a default
    if nargs < 5
        eta = 0.5;
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
    
    while norm( grad ) >= epsilon
        
        % initial value of lambda (normalization constant for hessian)
        lambda_s = 0.0001;
        
        % while relaxed hessian is not positive definite, increase lambda_s
        % (as determined by smallest eigenvalue being negative)
        while min( eig( hessian + lambda_s * eye( dim ) ) ) < 0
           lambda_s = lambda_s * 10; 
        end
        
        % solve linear system ( quadratic aproximation to function)
        % to find next newton step
        dxs = -grad \ ( hessian + lambda_s * eye( dim ) );
        
        % initial value of step size
        as = 1;
        
        % decrease step size until a sufficient decrease in function
        % value is achieved (how much is sufficient is controlled by eta
        while func( xs + as * dxs ) - fsx >= eta * as * grad' * dsx
           as = as / 2.0; 
        end
        
        % update guess
        xs = xs + as * dxs;
        
        % update iteration counter and output status
        iter = iter + 1;
    end
end

