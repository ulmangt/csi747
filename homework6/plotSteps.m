function z = plotSteps( func, xrange, yrange, steps )
    % doesn't quite do what I need:
    % http://stackoverflow.com/questions/3784059/contour-plot-a-custom-function
    
    z = zeros( length( yrange ), length( xrange ) );
    
    for i = 1:length( xrange )
        for j = 1:length( yrange )
            z(j,i) = func( [ xrange(i) yrange(j) ] );
        end
    end
    
    contour( xrange, yrange, z, 50 )
    hold on
    plot( steps(1,:), steps(2,:), '--', 'LineWidth', 1 )
    hold off
end

