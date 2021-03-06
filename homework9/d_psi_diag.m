function [ y ] = d_psi_diag( x, k, c )
%D_PSI_DIAG diagonalized D_PSI
    y = diag( arrayfun( @d_psi, k*c(x) ) );
end