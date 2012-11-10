function [ x y ] = rescaling_augmented_lagrangian( f, df, hf, g, dg, hg, guess, epsilon, eta, k )
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

    % iteration counter
    iter = 0;

end