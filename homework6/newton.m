function [ xs ] = newton( func, grad_hessian_func, guess, epsilon )
%NEWTON Find minimum value of func
%   Detailed explanation goes here

    % if no epsilon was provided, set a default
    if nargs < 4
        epsilon = 0.0001;
    end
    
    % set the current solution to the initial guess
    xs = guess;

    % evaluate the gradient and hessian at xs
    [grad hessian] = grad_hessian_func( xs );
    
    while norm( grad ) >= epsilon
        
    end
end

