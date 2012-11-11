function [ y ] = f_1( x )
%F_1 function to minimize
    y = 3*x(1) + 2*x(2) + x(3) + x(4);
end

function [ y ] = df_1( x )
%DF_1 gradient vector of funcion to minimize
    y = [ 3 ; 2 ; 1 ; 1 ];
end

function [ y ] = hf_1( x )
%HF_1 hessian matrix of function to minimize
    y = zeros( 4 );
end

function [ lambda ] = c_1( x )
%C_1 constraints of function to minimize
    lambda = [ -x(1)^2 - x(2)^2 - x(3)^2 - x(4)^2 + 10 ;
                                              x(1) - 1 ];
end

function [ lambda ] = dc_1( x )
%DC_1 gradient vectors of constraints
    lambda = [ -2*x(1), -2*x(2), -2*x(3), -2*x(4)  ;
                    1,      0,      0,      0 ];
end

function [ lambda ] = hc_1( x, i )
%HC_1 hessian matrix of constraints
    if i == 1
        lambda = -2 * eye(4);    
    elseif i == 2
        lambda = zeros(4);
    end
end

function [ lambda ] = g_1( x )
%G_1 constraints of function to minimize
    lambda = [ x(1) + x(2) + 2*x(3) + 3*x(4) - 1 ];
end

function [ lambda ] = dg_1( x )
%DG_1 constraints of function to minimize
    lambda = [ 1 , 1 , 2 , 3 ];
end

function [ lambda ] = hg_1( x, i )
%HG_1 hessian matrix of constraints
    lambda = zeros(4);
end



function [ y ] = f_2( x )
%F_2 function to minimize
    y = x(1) + x(2)^2 + x(3) + x(4) + x(5)^4;
end

function [ y ] = df_2( x )
%DF_2 gradient vector of funcion to minimize
    y = [ 1 ; 2*x(2) ; 1 ; 1 ; 4*x(5)^3 ];
end

function [ y ] = hf_2( x )
%HF_2 hessian matrix of function to minimize
    y = [ [ 0 0 0 0 0 ] ;
          [ 0 2 0 0 0 ] ;
          [ 0 0 0 0 0 ] ;
          [ 0 0 0 0 0 ] ;
          [ 0 0 0 0 12*x(5)^2] ];
end

function [ lambda ] = c_2( x )
%C_2 constraints of function to minimize
    lambda = [ -x(1)^2 - x(2)^2 - x(3)^2 - x(4)^2 +        9    ;
               -x(1)^2 +                            x(5) + 2    ;
                                           x(4)          - 0.5 ];
end

function [ lambda ] = dc_2( x )
%DC_2 gradient vectors of constraints
    lambda = [ -2*x(1), -2*x(2), -2*x(3), -2*x(4),  0   ;
               -2*x(1),       0,       0,       0,  1   ;
                     0,       0,       0,       1,  0  ];
end

function [ lambda ] = hc_2( x, i )
%HC_2 hessian matrix of constraints
    if i == 1
        lambda = [ [ -2  0  0  0  0 ]
                   [  0 -2  0  0  0 ]
                   [  0  0 -2  0  0 ]
                   [  0  0  0 -2  0 ]
                   [  0  0  0  0  0 ] ];
    elseif i == 2
        lambda = zeros(5);
        lambda(1,1) = -2;
    elseif i == 3
        lambda = zeros(5);
    end
end

function [ lambda ] = g_2( x )
%G_2 constraints of function to minimize
    lambda = [ x(1) + 2*x(2) + 2*x(3) + 4*x(4) - 1 ;
                               2*x(3) - 4*x(4) - 1 ];
end

function [ lambda ] = dg_2( x )
%DG_2 constraints of function to minimize
    lambda = [ 1 2 2  4 0 ;
               0 0 2 -4 0 ];
end

function [ lambda ] = hg_2( x, i )
%HG_2 hessian matrix of constraints
    if i == 1
        lambda = zeros(5);    
    elseif i == 2
        lambda = zeros(5);
    end
end


function [ y ] = psi( t )
%PSI
    if t >= -0.5
        y = log( t + 1 );
    else
        y = -2*t^2 - 0.19314718;
    end
end

function [ y ] = d_psi( t )
%PSI 1st derivative
    if t >= -0.5
        y = 1 / ( t + 1 );
    else
        y = -4*t;
    end
end

function [ y ] = dd_psi( t )
%PSI 2st derivative
    if t >= -0.5
        y = -1 / ( t + 1 )^2;
    else
        y = -4;
    end
end

function [ y ] = d_psi_diag( x, k, c )
%D_PSI_DIAG diagonalized D_PSI
    y = diag( arrayfun( @d_psi, k*c(x) ) );
end

function [ y ] = dd_psi_diag( x, k, c )
%DD_PSI_DIAG diagonalized DD_PSI
    y = diag( arrayfun( @dd_psi, k*c(x) ) );
end
