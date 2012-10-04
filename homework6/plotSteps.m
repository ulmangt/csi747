function z = plotSteps( func, xrange, yrange )
    % doesn't quite do what I need:
    % http://stackoverflow.com/questions/3784059/contour-plot-a-custom-function
    
    len = length( xrange );
    z = zeros( len, len );
    
    for i = 1:len
        for j = 1:len
            z(i,j) = func( [ xrange(i) yrange(j) ] );
        end
    end
    
    contour( xrange, yrange, z )
end

