function [ x y ] = augmented_lagrangian( f, df, hf, g, dg, hg, guess, epsilon, k )
%AUGMENTED_LAGRANGIAN Find minimum value of func subject to constraints

    % if no epsilon was provided, set a default
    if nargin < 8
        epsilon = 0.001;
    end
    
    % if no penalty function constant k was provided, set a default
    if nargin < 9
        k = 1;
    end
    
    % initial values for primal variable
    x = guess;
    
    % number of constraints / dual variables
    dg_x_size = size( dg( x ) );
    nc = dg_x_size(1);
    
    % number of primal variables
    np = length( x );

    % initial values for dual variable
    y = zeros( nc, 1 );

    % stopping condition
    norm_g = norm( g( x ) );

    % hessian of AL
    function [ret] = hAL(x,y,k)
        sum1 = zeros(nc);
    	for i=1:nc
            sum1 = sum1 + hg(x,i)*y(i);
        end
        
        sum2 = zeros(nc);
        g_x = g(x);
        for i=1:nc
        	sum2 = sum2 + hg(x,i)*g_x(i);
        end
        
        ret = hf(x) - sum1 + k*sum2 + k*dg(x)'*dg(x);
    end
    
    while ( norm_g >= epsilon )
        
        % augmented lagrangian
    	AL  = @(x)(f(x)-y*g(x)+(k/2.0)*norm(g(x))^2);
        % gradient of AL
        gAL = @(x)(df(x)'-dg(x)'*y+k*dg(x)'*g(x));
        % hessian of AL (with x as only parameter)
        hAL_yk = @(x)(hAL(x,y,k));
        
        x = newton( AL, gAL, hAL_yk, x, epsilon );
        y = y - k * g(x);
        
        norm_g = norm( g(x) );
    end

end