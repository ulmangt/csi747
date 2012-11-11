function [ x y z ] = rescaling_augmented_lagrangian( f, df, hf, g, dg, hg, c, dc, hc, guess, epsilon, eta, k )
%RESCALING_AUGMENTED_LAGRANGIAN Find minimum value of func subject to constraints

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
    
    % number of inequality constraints / dual variables
    dg_x_size = size( dg( x ) );
    ng = dg_x_size(1);
    
    % number of equality constraints / dual variables
    dc_x_size = size( dc( x ) );
    nc = dc_x_size(1);
    
    % number of primal variables
    np = length( x );

    % initial values for dual variable
    y = ones( nc, 1 );
    z = ones( ng, 1 );

    % stopping value (initally infinite -- we do at least one iteration)
    stop = inf;
    
    % iteration counter
    iter = 0;
    
    % phi w.r.t. x
    function [ret] = phi( xi, yi, zi, ki )
        sum1 = 0;
        
        c_x = c(xi);
        for j=1:nc
           sum1 = sum1 + yi(j)*psi(ki*c_x(j)); 
        end
        
        ret = f(xi) - (1/ki) * sum1 - dot(zi,g(xi))+(k/2.0)*norm(g(xi))^2;
    end

    % gradient phi w.r.t x
    function [ret] = d_phi( xi, yi, zi, ki )
        ret = df(xi) - dc(xi)'*d_psi_diag(xi,ki,c)*yi - dg(xi)'*zi+k*dg(xi)'*g(xi)';
    end

    % hessian of phi w.r.t. x
    function [ret] = h_phi( xi, yi, zi, ki )
       sum1 = 0;
       
       c_x = c(xi);
       for j=1:nc
           sum1 = sum1 + hc(xi,j)*d_psi(ki*c_x(j))*yi(j);
       end
       
       nr = -sum1-ki*dc(xi)'*diag(yi)*dd_psi_diag(xi,ki,c)*dc(xi);
       
       
       sum2 = zeros(np);
       for i=1:ng
           sum2 = sum2 + hg(xi,i)*zi(i);
       end
        
       sum3 = zeros(np);
       g_x = g(xi);
       for i=1:ng
           sum3 = sum3 + hg(xi,i)*g_x(i);
       end
        
       al = -sum2 + ki*sum3 + ki*dg(xi)'*dg(xi);
       
       ret = hf(xi) + nr + al;
    end

    while ( stop >= epsilon )
        
        % phi w.r.t x
        phi_yk = @(x) ( phi( x, y, z, k ) ); 
        
        % gradient of phi w.r.t. x
        d_phi_yk = @(x)( d_phi( x, y, z, k ) );
       
        % hessian of phi w.r.t. x
        h_phi_yk = @(x)( h_phi( x, y, z, k ) );  
        
        % stop criteria function
        stop = @(x)( max( [epsilon, norm(g(x)), (1/k)*norm(y-d_psi_diag(x,k,c)*y)] ) );
        
        % update x
        x = newton( phi_yk, d_phi_yk, h_phi_yk, x, eta, stop );
        
        % update y
        for i=1:nc
           c_x = c(x);
           y(i) = y(i)*d_psi(k*c_x(i)); 
        end
        
        % update z
        for i=1:ng
           g_x = g(x);
           z(i) = z(i) - k * g_x(i);
        end
        
        stop1 = norm( d_phi( x, y, z, k ) );
        stop2 = norm( diag(y)*c(x)' );
        stop3 = max( -c(x) );
        stop4 = norm( g(x) );
        stop = max( [stop1,stop2,stop3,stop4] );
        
        iter = iter + 1;
        str = sprintf( 'Iteration: %d F(x): %f Stop Criteria: %f x:%s y:%s\n', iter, f( x ), stop, num2str( x' ), num2str( y' ) );
        disp( str );
        
    end

end