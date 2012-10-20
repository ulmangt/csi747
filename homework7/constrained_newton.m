function [ xs iter steps ] = constrained_newton( f, df, hf, g, dg, guess, epsilon )
%CONSTRAINED_NEWTON Find minimum value of func subject to constraints
% f: function to minimize
% df: gradient of f
% hf: hessian of h
% g: constraints
% dg: gradient of g

    % if no epsilon was provided, set a default
    if nargin < 7
        epsilon = 0.001;
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
    norm_grad = inf;

    % iteration counter
    iter = 0;
    
    % store steps
    steps = x;
    
    while ( norm_grad >= epsilon )

        % evaluate function and constraints at x
        g_x  =  g( x );
        dg_x = dg( x );
        f_x  =  f( x );
        df_x = df( x );
        hf_x = hf( x );
        
        % dual regularization
        beta = 0;

        while ( rank( [ dg_x' ; beta * eye( nc ) ] ) ~= nc )
           if beta == 0
               beta = 0.0001;
           else
               beta = beta * 10;
           end
        end

        % primal regularization
        lambda = 0.0001;

        while ( min( eig( hf_x + lambda * eye( np ) ) ) < 0 )
           if lambda == 0
               lambda = 0.0001;
           else
               lambda = lambda * 10;
           end
        end

        % build left hand side matrix
        lhs = [ hf_x + lambda * eye( np ), -dg_x' ; dg_x, beta * eye( nc ) ] ;

        % build right hand side vector
        rhs = [ -df_x' + dg_x' * y ; -g_x ];

        % solve linear system ( quadratic aproximation to function)
        % to find next step for primal and dual variables
        dxdy = linsolve( lhs, rhs );
        
        % update stopping condition
        norm_grad = norm( dxdy );
        
        dx = dxdy(1:np);
        dy = dxdy(np+1:np+nc);

        x = x + dx';
        y = y + dy';
        
        % store each step
        steps = [steps x];
        
        % update iteration counter and output status
        iter = iter + 1;
        
        str = sprintf( 'Iteration: %d F(x): %f Gradient: %f beta: %f lambda: %f\n', iter, f(x), norm_grad, beta, lambda );
        disp( str );

    end

end