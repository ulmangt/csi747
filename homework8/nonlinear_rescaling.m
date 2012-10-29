function [ x y ] = nonlinear_rescaling( f, df, hf, c, dc, hc, guess, epsilon, eta, k )
%NONLINEAR_RESCALING Find minimum value of func subject to constraints

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
    dc_x_size = size( dc( x ) );
    nc = dc_x_size(1);
    
    % number of primal variables
    np = length( x );

    % initial values for dual variable
    y = zeros( nc, 1 );
    
    % stopping value (initally infinite -- we do at least one iteration)
    stop = inf;
    
    % iteration counter
    iter = 0;
    
    % phi w.r.t. x
    function [ret] = phi( xi, yi, ki )
        sum1 = 0;
        
        for i=1:nc
           c_x = c(x);
           yi(i)*psi(ki*c_x(i)); 
        end
        
        ret = f(xi) - (1/ki) * sum1;
    end
    
    % hessian of phi w.r.t. x
    function [ret] = h_phi( xi, yi, ki )
       sum1 = 0;
       
       for i=1:nc
            sum1 = sum1 + hc(xi,i)*d_psi_diag(xi,ki,c)*yi(i);
       end
       
       ret = hf(xi)-sum1-ki*dc(xi)'*(eye(nc)*yi)*dd_psi_diag(xi,ki,c)*dc(xi);
    end
    
    while ( stop >= epsilon )
        
        % phi w.r.t x
        phi_yk = @(x) ( phi( x, y, k ) ); 
        
        % gradient of phi w.r.t. x
        d_phi_yk = @(x)( df(x) - (dc(x)'*y*d_psi_diag(x,k,c))' );
       
        % hessian of phi w.r.t. x
        h_phi_yk = @(x)( h_phi( x, y, k ) );  
        
        % stop criteria function
        stop = @(x)( max( [epsilon, (1/k)*norm(y-d_psi(k*c(x))*y)] ) )
        
        % update x
        x = newton( phi_yk, d_phi_yk, h_phi_yk, x, epsilon, eta, stop );
        
        % update y
        for i=1:nc
           c_x = c(x);
           y(i) = y(i)*d_psi(k*c_x(i)); 
        end
        
        stop1 = phi( x, y, k );
        stop2 = (eye(nc)*y)*c(x);
        stop3 = max( -c(x) );
        stop = max( [stop1,stop2,stop3] );
        
        iter = iter + 1;
        str = sprintf( 'Iteration: %d F(x): %f Stop Criteria: %f x:%s y:%s\n', iter, f( x ), stop, num2str( x ), num2str( y' ) );
        disp( str );
        
    end
end