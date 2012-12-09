function [ digit_predicted ] = calculate_digit_predicted( y_predicted )
% convert the matrix of y value predictions (one column for each digit)
% and one row for each testing data point, into the most likely digit

    [ ntest ndigit ] = size( y_predicted );

    digit_predicted = zeros( ntest, 1 );
    
    for j=1:ntest
        [ m i ] = max( y_predicted(j,:) );
        digit_predicted(j) = i-1;
    end
    
end
