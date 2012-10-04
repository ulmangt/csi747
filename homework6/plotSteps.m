function z = plotSteps( func, xrange, yrange, steps )
    % doesn't quite do what I need:
    % http://stackoverflow.com/questions/3784059/contour-plot-a-custom-function
    
    len = length( xrange );
    z = zeros( len, len );
    
    for i = 1:len
        for j = 1:len
            z(j,i) = func( [ xrange(i) yrange(j) ] );
        end
    end
    
    contour( xrange, yrange, z )
    hold on
    plot( steps(1,:), steps(2,:), '--', 'LineWidth', 1 )
    hold off
end

