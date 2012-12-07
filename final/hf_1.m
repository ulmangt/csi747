function [ ret ] = hf_1( a, x, y, K )
%HF_1 hessian of function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    ret = zeros( length( a ) );
    for j=1:size( a )
        for i=1:size( a )
            ret(i,j) = -y(i)*y(j)*K(x(:,i),x(:,j));
        end
    end
end