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
    dg_x_size = size( dg( x ) );
    nc = dg_x_size(1);
    
    % number of primal variables
    np = length( x );

    % initial values for dual variable
    y = zeros( nc, 1 );
    
    % stopping value (initally infinite -- we do at least one iteration)
    stop = inf;
    
    % hessian of phi w.r.t. x
    function [ret] = h_phi( xi, yi, ki )
       sum1 = 0;
       
       for i=1:nc
            sum1 = sum1 + hc(xi,i)*d_psi_diag(xi)*yi(i);
       end
       
       ret = hf(xi)-sum1-k*dc(xi)'
    end
    
    while ( stop >= epsilon )
        
        % gradient of phi w.r.t. x
        d_phi = @(x)( df(x) - dc'*y*p_psi_diag(x) )
       
               % hessian of phi w.r.t. x
        h_phi = @(x)( hf(x)  
        
    end
end