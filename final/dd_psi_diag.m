function [ y ] = dd_psi_diag( a, k, c )
%DD_PSI_DIAG diagonalized DD_PSI
    y = diag( arrayfun( @dd_psi, k*c(a) ) );
end