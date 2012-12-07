
% load x matrix from file
x3 = readFile( 'train3.txt' );
x6 = readFile( 'train6.txt' );
x  = [ x3 x6 ];

size3 = size( x3 );
size6 = size( x6 );

% build y vector
y  = [ ones( size3(2), 1 ); -ones( size6(2), 1 ) ];

% curry functions to build input functions to
% rescaling_augmented_lagrangian with correct arguments
K = @( x1, x2 ) ( polynomial_kernel( x1, x2, 0.0156, 0, 3 ) );

f = @( a ) ( f_1( a, x, y, K ) );
df = @( a ) ( df_1( a, x, y, K ) );
hf = @( a, i ) ( hf_1( a, i, x, y, K ) );

c = @( a ) ( c_1( a, y ) );
dc = @( a ) ( dc_1( a, y ) );
hc = @( a, i ) ( hc_1( a, i ) );

g = @( a ) ( g_1( a ) );
dg = @( a ) ( dg_1( a ) );
hg = @( a, i ) ( hg_1( a, i ) );
