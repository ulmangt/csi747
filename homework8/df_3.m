function [ y ] = df_3( x )
%DF_3 gradient vector of funcion to minimize
    y = [ 9*x(1)^2; 6*x(2)^2; 3*x(3)^2; 3*x(4)^2 ];
end