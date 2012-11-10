function [ x y ] = augmented_lagrangian( f, df, hf, g, dg, hg, guess, epsilon, eta, k )
%AUGMENTED_LAGRANGIAN Find minimum value of func subject to constraints

    % if no epsilon was provided, set a default
    if nargin < 8
        epsilon = 0.001;
    end
    
    % eta controls how much of a function value decrease newton requires
    if nargin < 9
        eta = 0.2;
    end
    
    % if no penalty function constant k was provided, set a default
    % increase k to combat ill-conditioning in constraints
    if nargin < 10
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
    function [ret] = hAL(xi,yi,ki)
        sum1 = zeros(np);
        for i=1:nc
            sum1 = sum1 + hg(xi,i)*yi(i);
        end
        
        sum2 = zeros(np);
        g_x = g(xi);
        for i=1:nc
        	sum2 = sum2 + hg(xi,i)*g_x(i);
        end
        
        ret = hf(xi) - sum1 + ki*sum2 + ki*dg(xi)'*dg(xi);
    end
    
    while ( norm_g >= epsilon )
        
        % augmented lagrangian
    	AL  = @(xi)(f(xi)-dot(y,g(xi))+(k/2.0)*norm(g(xi))^2);
        % gradient of AL
        gAL = @(xi)(df(xi)'-dg(xi)'*y+k*dg(xi)'*g(xi)');
        % hessian of AL (with x as only parameter)
        hAL_yk = @(xi)(hAL(xi,y,k));
        
        x = newton( AL, gAL, hAL_yk, x, epsilon, eta );
        y = y - k * g(x)';
        
        norm_g = norm( g(x) );
        
        iter = iter + 1;
        str = sprintf( 'Iteration: %d F(x): %f Norm G(x): %f Constraint Violation: %s x:%s y:%s\n', iter, f( x ), norm_g, num2str( g( x ) ), num2str( x ), num2str( y' ) );
        disp( str );
    end

end