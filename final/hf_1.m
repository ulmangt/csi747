function [ ret ] = hf_1( a, x, y, K )
%HF_1 hessian of function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    ret = (y*y').*K;
end