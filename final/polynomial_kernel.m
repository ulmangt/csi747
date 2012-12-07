function [ ret ] = polynomial_kernel( x1, x2, alpha, beta, delta )
    ret = ( alpha * dot( x1, x2 ) + beta ) ^ delta ;
end