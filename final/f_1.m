function [ y ] = f_1( a, x, y, K )
%F_1 function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    size = size(a);
    sum = 0;
    for i=1:size
       for j=1:size
           sum = sum + a(i)*a(j)*y(i)*y(j)*K(x(i),x(j));
       end
    end

    y = sum( a ) - 0.5 * sum;
end