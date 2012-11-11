function [ y ] = df_2( x )
%DF_2 gradient vector of funcion to minimize
    y = [ 1 ; 2*x(2) ; 1 ; 1 ; 4*x(5)^3 ];
end