function [ y ] = dd_psi_diag( x )
%DD_PSI_DIAG diagonalized DD_PSI
    y = diag( arrayfun( @dd_psi, k*c(x) ) );
end