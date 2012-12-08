function [ y_predicted ] = calculate_y_predicted( a, b, x_test, x_train, y_train, kernel )
    
    [ np ntrain ] = size( x_train );
    [ np ntest ] = size( x_test );

    y_predicted = zeros( ntest, 1 );
  
    for j=1:ntest        
        sum1 = 0;
        for i=1:ntrain
            sum1 = sum1 + y_train(i) * a(i) * kernel(x_test(:,j),x_train(:,i));
        end
        y_predicted(j) = sum1 - b;
    end
    
end