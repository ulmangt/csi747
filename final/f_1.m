function [ ret ] = f_1( a, x, y, K )
%F_1 function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    sum = 0;
    for i=1:size(a)
       for j=1:size(a)
           sum = sum + a(i)*a(j)*y(i)*y(j)*K(x(i),x(j));
       end
    end

    ret = sum( a ) - 0.5 * sum;
end