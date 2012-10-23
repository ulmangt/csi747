function [ y ] = f_1( x )
%F_1 function to minimize
    y = 2 * x(1) - 3 * x(2);
end

function [ y ] = f_2( x )
%F_2 function to minimize
    y = x(1)^2 + 2*x(1)*x(2) + x(2)^2;
end

function [ y ] = f_3( x )
%F_3 function to minimize
    y = 3*x(1)^3 + 2*x(2)^3+x(3)^3+x(4)^3;
end



function [ y ] = df_1( x )
%DF_1 gradient vector of funcion to minimize
    y = [ 2 , -3 ];
end

function [ y ] = df_2( x )
%DF_2 gradient vector of funcion to minimize
    y = [ 2 * x(1) + 2 * x(2) , 2 * x(2) + 2 * x(1) ];
end

function [ y ] = df_3( x )
%DF_3 gradient vector of funcion to minimize
    y = [ 9*x(1)^2, 6*x(2)^2, 3*x(3)^2, 3*x(4)^2 ];
end



function [ y ] = hf_1( x )
%HF_1 hessian matrix of function to minimize
    y = [ 0 , 0 ; 0 , 0 ];
end

function [ y ] = hf_1( x )
%HF_2 hessian matrix of function to minimize
    y = [ 2 , 2 ; 2 , 2 ];
end

function [ y ] = hf_3( x )
%HF_3 hessian matrix of function to minimize
    y = [ 18*x(1), 0, 0, 0 ;
          0, 12*x(2), 0, 0 ;
          0, 0,  6*x(3), 0 ;
          0, 0, 0, 6*x(4) ];
end



function [ lambda ] = g_1( x )
%G_1 constraints of function to minimize
    lambda = [ x(1)^2 + x(2)^2 - 25 ];
end

function [ lambda ] = g_2( x )
%G_2 constraints of function to minimize
    lambda = [ 3 * x(1)^2 + x(2)^2 - 9 ];
end

function [ lambda ] = g_3( x )
%G_3 constraints of function to minimize
    lambda = [ x(1)^2 + x(2)^2 + x(3)^2 + x(4)^2 - 4, x(1) + x(2) + 2*x(3) + 3*x(4) - 1 ];
end



function [ lambda ] = dg_1( x )
%DG_1 gradient vectors of constraints
    lambda = [ 2 * x(1) , 2 * x(2) ];
end

function [ lambda ] = dg_2( x )
%DG_2 gradient vectors of constraints
    lambda = [ 6 * x(1) , 2 * x(2) ];
end

function [ lambda ] = dg_3( x )
%DG_3 gradient vectors of constraints
    lambda = [ 2*x(1), 2*x(2), 2*x(3), 2*x(4)  ;
                    1,      1,      2,      3 ];
end



function [ lambda ] = hg_1( x, i )
%HG_1 hessian matrix of constraints
    lambda = [ 2 , 0 ;
               0 , 2 ];
end

function [ lambda ] = hg_2( x, i )
%HG_2 hessian matrix of constraints
    lambda = [ 6 , 0 ;
               0 , 2 ];
end

function [ lambda ] = hg_3( x, i )
%HG_3 hessian matrix of constraints
    if i == 1
        lambda = 2 * eye(4);    
    elseif i == 2
        lambda = zeros(4);
    end
end
