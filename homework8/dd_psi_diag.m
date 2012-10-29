function [ y ] = dd_psi_diag( x, k )
%DD_PSI_DIAG diagonalized DD_PSI
    y = diag( arrayfun( @dd_psi, k*c(x) ) );
end