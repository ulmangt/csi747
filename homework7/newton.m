function xs = newton( func, grad_func, hessian_func, guess, epsilon, eta )
%NEWTON Find minimum value of func

    % if no epsilon was provided, set a default
    if nargin < 5
        epsilon = 0.001;
    end

    % if no eta was provided, set a default
    if nargin < 6
        eta = 0.2;
    end
    
    % set the current solution to the initial guess
    xs = guess;
    
    % dimension of func domain
    dim = length( xs );
    
    % evaluate the function, gradient, and hessian at x_s
    grad = grad_func( xs );
    hessian = hessian_func( xs );
    fsx = func( xs );
    
    while norm( grad ) >= epsilon
        
        % initial value of lambda (normalization constant for hessian)
        lambda_s = 0.0001;
        
        % while relaxed hessian is not positive definite, increase lambda_s
        % (as determined by smallest eigenvalue being negative)
        relaxed_hessian = hessian + lambda_s * eye( dim );
        
        while min( eig( relaxed_hessian ) ) <= 0
           lambda_s = lambda_s * 10;
           relaxed_hessian = hessian + lambda_s * eye( dim );
        end
        
        % solve linear system ( quadratic aproximation to function)
        % to find next newton step
        dxs = linsolve( relaxed_hessian, -grad );
        
        % initial value of step size
        as = 1.0;
        
        % decrease step size until a sufficient decrease in function
        % value is achieved (how much is sufficient is controlled by eta
        while func( xs' + as * dxs ) - fsx >= eta * as * grad' * dxs
           as = as / 2.0; 
        end
        
        % update guess
        xs = xs + as * dxs';
        
        % evaluate the function, gradient, and hessian at x_s
        grad = grad_func( xs );
        hessian = hessian_func( xs );
        fsx = func( xs );
    end
end

