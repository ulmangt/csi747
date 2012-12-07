function [ ret ] = df_1( a, x, y, K )
%DF_1 gradient of function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    ret = zeros( length( a ), 1 );

    for i=1:length( a )
       sum1 = 0;
       
       for j=1:length( a )
          sum1 = sum1 + 2*a(j)*y(j)*y(i)*K(x(:,i),x(:,j));
       end
        
       ret(i) = -1 + 0.5*sum1;
    end
end