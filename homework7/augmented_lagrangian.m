function [ xs iter steps ] = augmented_lagrangian( f, df, hf, g, dg, hg, guess, epsilon, k )
%AUGMENTED_LAGRANGIAN Find minimum value of func subject to constraints

    % if no epsilon was provided, set a default
    if nargin < 7
        epsilon = 0.001;
    end
    
    % if no penalty function constant k was provided, set a default
    if nargin < 8
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
    
    AL  = @(x,y,k)(f(x)-y*g(x)+(k/2.0)*norm(g(x))^2);
    
    % gradient of AL
    gAL = @(x,y,k)(df(x)'-dg(x)'*y+k*dg(x)'*g(x));
    
    % a helper function to return the ith index of vector
    subindex = @(vec,i)(vec(i));
    % inner statement in first summation in hessian AL
    isum1 = @(x,y,i)(subindex(hg(x),i)*y(i));
    % first summation in hessian AL
    sum1 = @(x,y)(sum(arrayfun(isum1,x*ones(nc,1),y*ones(nc,1),1:nc)));
    % inner statement in second summation in hessian AL
    isum2 = @(x,y,i)(subindex(hg(x),i)*subindex(g(x),i));
    % second summation in hessian AL
    sum2 = @(x,y)(sum(arrayfun(isum2,x*ones(nc,1),y*ones(nc,1),1:nc)));
    % hessian of AL
    hAL = @(x,y,k)(hf(x)-sum1(x,y)+k*sum2(x,y)+k*dg(x)'*g(x));
    
    AL(x,y,k)
    gAL(x,y,k)
    hAL(x,y,k)
    
    %while ( norm_g >= epsilon )
       
        
        
    %end

end