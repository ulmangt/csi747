function [ ret ] = calculate_b( a, y, K, C )
% given optimal a and y vector and kernel values K, calculate corresponding b
    
    b = zeros( length( a ), 1 );
    
    % calculate b for all a
    for j=1:length( a )
       b(j) = sum( y.*a.*K(:,j) ) - y(j); 
    end
    
    % average all the b values corresponding to support vectors
    sum1 = 0;
    count1 = 0;
    for j=1:length( a )
       if a(j) > 1e-4 && a(j) < C-1e-4
           sum1 = sum1 + b(j);
           count1 = count1 + 1;
       end
    end
    
    ret = sum1 / count1;
end
