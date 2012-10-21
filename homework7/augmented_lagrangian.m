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
    
    % a helper function to return the ith index of vector
    %subindex = @(vec,i)(vec(i));
    %uncell = @(cell)(cell{1});
    % first summation in hessian AL
    %sum1 = @(x,y)(cellfun(@sum,arrayfun(@(i){hg(x,i)*y(i)},1:nc),'UniformOutput',false));
    % second summation in hessian AL
    %sum2 = @(x,y)(sum(arrayfun(@(i)(hg(x,i)*subindex(g(x),i)),1:nc)));
    % hessian of AL
    %hAL = @(x,y,k)(hf(x)-sum1(x,y)+k*sum2(x,y)+k*dg(x)'*g(x));
    
    AL(x,y,k)
    gAL(x,y,k)
    
    %hf(x)
    %arrayfun(@(i){hg(x,i)*y(i)},1:nc)
    %uncell(sum1(x,y))
    %sum2(x,y)
    %dg(x)'*dg(x)
    
    hAL(x,y,k)
    
    %while ( norm_g >= epsilon )
       
        
        
    %end

end