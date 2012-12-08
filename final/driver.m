
% load x matrix from file
x3 = readFile( 'train3.txt' );
x6 = readFile( 'train6.txt' );
x  = [ x3 x6 ];

size3 = size( x3 );
size6 = size( x6 );

% build y vector
y  = [ ones( size3(2), 1 ); -ones( size6(2), 1 ) ];

% pre-calculate kernel values for all i,j
kernel = @(x1,x2) (radial_kernel(x1,x2,0.0521));
%kernel = @(x1,x2) (polynomial_kernel(x1,x2,0.0156,0,3));
%kernel = @(x1,x2) (dot(x1,x2));
       
K = zeros( length( y ) );
for i=1:length(y)
   for j=1:length(y)
       K(i,j) = kernel(x(:,i),x(:,j));
   end
end

C = 100;

% curry functions to build input functions to
% rescaling_augmented_lagrangian with correct arguments
f = @( a ) ( f_1( a, x, y, K ) );
df = @( a ) ( df_1( a, x, y, K ) );
hf = @( a ) ( hf_1( a, x, y, K ) );

g = @( a ) ( g_1( a, y ) );
dg = @( a ) ( dg_1( a, y ) );
hg = @( a, i ) ( hg_1( a, i ) );

c = @( a ) ( c_1( a, C ) );
dc = @( a ) ( dc_1( a ) );
hc = @( a, i ) ( hc_1( a, i ) );

% initial guess vector
guess = zeros( length( y ), 1 );

[ a l1 l2 ] = rescaling_augmented_lagrangian( f, df, hf, g, dg, hg, c, dc, hc, guess, 1e-7, 0.8, 100 );

b = calculate_b( a, y, K, C );
y_predicted = calculate_y_predicted( a, b, x, x, y, kernel );
calculate_error_rate( y_predicted, y, @digit_picker_36 );