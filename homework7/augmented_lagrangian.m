function [ xs iter steps ] = augmented_lagrangian( f, df, hf, g, dg, guess, epsilon, k )
%AUGMENTED_LAGRANGIAN Find minimum value of func subject to constraints

    % if no epsilon was provided, set a default
    if nargin < 7
        epsilon = 0.001;
    end
    
    % if no penalty function constant k was provided, set a default
    if nargin < 8
        k = 1;
    end
    
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
    
    while ( norm_g >= epsilon )
       
        
        
    end

end