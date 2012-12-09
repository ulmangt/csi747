function [ ret ] = df_1( a, x, y, K )
%DF_1 gradient of function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    ret = -1 + ((y*y').*K)*a;
end