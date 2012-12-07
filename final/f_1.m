function [ ret ] = f_1( a, x, y, K )
%F_1 function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    ret = - sum( a ) + 0.5 * sum( sum( (a*a') .* (y*y') .* K ) );
end