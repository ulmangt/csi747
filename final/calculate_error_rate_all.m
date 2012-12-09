function [ error_rate ] = calculate_error_rate_all( digit_predicted, digit_all )
% given a vector of predictions and actual values, return the classifier error rate

    size = length( digit_predicted );
    correct_sum = 0.0;
    for j=1:size
       if ( digit_predicted(j) ~= digit_all(j) )
          correct_sum = correct_sum + 1; 
       end
    end
    
    error_rate = correct_sum / size;
    error_interval = 1.96 * sqrt( error_rate * ( 1 - error_rate ) / size );
    
    str = sprintf( 'Error Rate: %f\nTrain Interval: %f %f\n', error_rate, error_rate-error_interval, error_rate+error_interval );
    disp( str );
end
