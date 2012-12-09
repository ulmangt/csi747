function [ ret ] = radial_kernel( x1, x2, gamma )
    ret = exp( -gamma * sum( (x1 - x2).^2 ) ) ;
end