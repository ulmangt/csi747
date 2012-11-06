function [ y ] = df_2( x )
%DF_2 gradient vector of funcion to minimize
    y = [ 2 * x(1) + 2 * x(2) ; 2 * x(2) + 2 * x(1) ];
end
