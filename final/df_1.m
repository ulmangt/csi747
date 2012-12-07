function [ ret ] = df_1( a, x, y, K )
%GF_1 gradient of function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    ret = zeros( length( a ), 1 );

    for i=1:size( a )
       sum = 0;
       for j=1:size( a )
          if i==j
             sum = sum + 2*a(i)*a(j)*y(j)*y(i)*K(x(i),x(j));
          else
             sum = sum + a(j)*y(j)*y(i)*K(x(i),x(j));
          end
       end
        
       ret(i) = 1 - 0.5*sum;
    end
end