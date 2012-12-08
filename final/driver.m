
% load x matrix from file
x3 = readFile( 'train3.txt' );
x6 = readFile( 'train6.txt' );
x  = [ x3 x6 ];

size3 = size( x3 );
size6 = size( x6 );

% build y vector
y  = [ ones( size3(2), 1 ); -ones( size6(2), 1 ) ];

% pre-calculate kernel values for all i,j
K = zeros( length( y ) );
for i=1:length(y)
   for j=1:length(y)
       K(i,j) = radial_kernel(x(:,i),x(:,j),0.0521);
       %K(i,j) = polynomial_kernel(x(:,i),x(:,j),0.0156,0,3);
       %K(i,j) = dot(x(:,i),x(:,j));
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

[x y z ] = rescaling_augmented_lagrangian( f, df, hf, g, dg, hg, c, dc, hc, guess, 1e-7, 0.8, 100 );