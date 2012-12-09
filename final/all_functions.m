%%%%%%% OBJECTIVE FUNCTION %%%%%%%


function [ ret ] = f_1( a, x, y, K )
%F_1 function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    ret = -sum( a ) + 0.5 * sum( sum( (a*a') .* (y*y') .* K ) );
end

function [ ret ] = df_1( a, x, y, K )
%DF_1 gradient of function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    ret = -1 + ((y*y').*K)*a;
end

function [ ret ] = hf_1( a, x, y, K )
%HF_1 hessian of function to minimize
% sum[i]( ai ) - 0.5 * sum[i,j](ai*aj*yi*yj*K(xi,xj))
    ret = (y*y').*K;
end


%%%%%%% INEQUALITY CONSTRAINTS %%%%%%%


function [ ret ] = g_1( a, y )
%G_1 inequality constraints
% 0 <= ai
% 0 <= C - ai
    ret = dot( a, y );
end

function [ ret ] = dg_1( a, y )
%DG_1 gradient of inequality constraints
% 0 <= ai
% 0 <= C - ai
    ret = y';
end

function [ ret ] = hg_1( a, i )
%HG_1 hessian of inequality constraints
% 0 <= ai
% 0 <= C - ai
% hessian is zero vector for any i
    ret = zeros( length( a ) );
end


%%%%%%% EQUALITY CONSTRAINTS %%%%%%%


function [ ret ] = c_1( a, C )
%C_1 equality constraints
% sum( a * y ) = 0
    ret = [ a ; C - a ];
end

function [ ret ] = dc_1( a )
%DC_1 gradient of equality constraints
% sum( a * y ) = 0
    ret = [ eye( length(a) ) ; -eye( length( a ) ) ];
end

function [ ret ] = hc_1( a, i )
%HC_1 hessian of equality constraints
% sum( a * y ) = 0
% hessian is zero vector for any i
    ret = zeros( length( a ) );
end


%%%%%%% PSI FUNCTIONS %%%%%%%


function [ y ] = psi( t )
%PSI
    if t >= -0.5
        y = log( t + 1 );
    else
        y = -2*t^2 - 0.19314718;
    end
end

function [ y ] = d_psi( t )
%PSI 1st derivative
    if t >= -0.5
        y = 1 / ( t + 1 );
    else
        y = -4*t;
    end
end

function [ y ] = d_psi_diag( a, k, c )
%D_PSI_DIAG diagonalized D_PSI
    y = diag( arrayfun( @d_psi, k*c(a) ) );
end

function [ y ] = dd_psi( t )
%PSI 2st derivative
    if t >= -0.5
        y = -1 / ( t + 1 )^2;
    else
        y = -4;
    end
end

function [ y ] = dd_psi_diag( a, k, c )
%DD_PSI_DIAG diagonalized DD_PSI
    y = diag( arrayfun( @dd_psi, k*c(a) ) );
end


%%%%%%% KERNEL FUNCTIONS %%%%%%%


function [ ret ] = polynomial_kernel( x1, x2, alpha, beta, delta )
    ret = ( alpha * dot( x1, x2 ) + beta ) ^ delta ;
end

function [ ret ] = radial_kernel( x1, x2, gamma )
    ret = exp( -gamma * sum( (x1 - x2).^2 ) ) ;
end


%%%%%%% HELPER FUNCTIONS %%%%%%%

function [ A ] = readFile( name )
%readFile read a handwriting data file
    fid = fopen( name, 'r' );
    A = fscanf( fid, '%d', inf );
    A = reshape( A, [ 8*8, length(A)/(8*8) ] );
    fclose( fid );
end


function [ K ] = precalculate_kernel( x, kernel )
% precalculate kernel values for all combinations of input vectors x
    sizex = size( x );
    n = sizex( 2 );
    K = zeros( n );
    for i=1:n
        for j=1:n
            K(i,j) = kernel(x(:,i),x(:,j));
       end
    end
end


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


function [ y_predicted ] = calculate_y_predicted( a, b, x_test, x_train, y_train, kernel )
% given optimal a vector, calculate the predicted y values for a testing data set    
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


function [ error_rate ] = calculate_error_rate( y_predicted, y_actual, digit_picker )
% given a vector of predictions and actual values, return the classifier error rate

    size = length( y_predicted );
    correct_sum = 0.0;
    for j=1:size
       if ( digit_picker( y_predicted(j) ) ~= digit_picker( y_actual(j) ) )
          correct_sum = correct_sum + 1; 
       end
    end
    
    error_rate = correct_sum / size;
    error_interval = 1.96 * sqrt( error_rate * ( 1 - error_rate ) / size );
    
    str = sprintf( 'Error Rate: %f\nTrain Interval: %f %f\n', error_rate, error_rate-error_interval, error_rate+error_interval );
    disp( str );
end


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


function [ digit ] = digit_picker_36( y )
    if y > 0
        digit = 3;
    else
        digit = 6;
    end
end
