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
