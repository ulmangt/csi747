function [ x y ] = augmented_lagrangian( f, df, hf, g, dg, hg, guess, epsilon, eta, k )
%AUGMENTED_LAGRANGIAN Find minimum value of func subject to constraints

    % if no epsilon was provided, set a default
    if nargin < 9
        epsilon = 0.001;
    end
    
    % eta controls how much of a function value decrease newton requires
    if nargin < 10
        eta = 0.2;
    end
    
    % if no penalty function constant k was provided, set a default
    % increase k to combat ill-conditioning in constraints
    if nargin < 11
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

    % iteration counter
    iter = 0;
    
    % hessian of AL
    function [ret] = hAL(x,y,k)
        sum1 = zeros(np);
    	for i=1:nc
            sum1 = sum1 + hg(x,i)*y(i);
        end
        
        sum2 = zeros(np);
        g_x = g(x);
        for i=1:nc
        	sum2 = sum2 + hg(x,i)*g_x(i);
        end
        
        ret = hf(x) - sum1 + k*sum2 + k*dg(x)'*dg(x);
    end
    
    while ( norm_g >= epsilon )
        
        % augmented lagrangian
    	AL  = @(x)(f(x)-dot(y,g(x))+(k/2.0)*norm(g(x))^2);
        % gradient of AL
        gAL = @(x)(df(x)'-dg(x)'*y+k*dg(x)'*g(x)');
        % hessian of AL (with x as only parameter)
        hAL_yk = @(x)(hAL(x,y,k));
        
        x = newton( AL, gAL, hAL_yk, x, epsilon, eta );
        y = y - k * g(x)';
        
        norm_g = norm( g(x) );
        
        iter = iter + 1;
        str = sprintf( 'Iteration: %d F(x): %f Gradient: %f\n', iter, f( x ), norm_g );
        disp( str );
    end

end