function [ y ] = d_psi_diag( a, k, c )
%D_PSI_DIAG diagonalized D_PSI
    y = diag( arrayfun( @d_psi, k*c(a) ) );
end