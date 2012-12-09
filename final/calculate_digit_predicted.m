function [ digit_predicted ] = calculate_digit_predicted( y_predicted )
    
    [ ntest ndigit ] = size( y_predicted );

    digit_predicted = zeros( ntest, 1 );
    
    for j=1:ntest
        [ m i ] = max( y_predicted(j,:) );
        digit_predicted(j) = i-1;
    end
    
end