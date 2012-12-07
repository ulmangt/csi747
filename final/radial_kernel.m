function [ ret ] = radial_kernel( x1, x2, gamma )
    ret = exp( -gamma * norm( x1 - x2 ) ) ;
end