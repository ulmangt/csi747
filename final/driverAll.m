
% load training data
train_x = [];
for i=0:9
    fileName = sprintf( 'train%d.txt', i );
    x = readFile( fileName );
    [ nd size_train ] = size( x ); 
    train_x = [ train_x x ];
end

% load testing data data
test_x = [];
for i=0:9
    fileName = sprintf( 'test%d.txt', i );
    x = readFile( fileName );
    [ nd size_test ] = size( x ); 
    test_x = [ test_x x ];
end

a_all = [];
b_all = [];

x = train_x;

% pre-calculate kernel values for all i,j
kernel = @(x1,x2) (radial_kernel(x1,x2,0.0521));
%kernel = @(x1,x2) (polynomial_kernel(x1,x2,0.0156,0,3));
%kernel = @(x1,x2) (dot(x1,x2));
K = precalculate_kernel( x, kernel );

for i=0:9    
    % build y vector
    y = -ones( size_train*10 , 1 );
    i1 = i*size_train+1;
    i2 = (i+1)*size_train;
    y(i1:i2) = ones( size_train, 1 );

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
    
    % build SVM
    [ a l1 l2 ] = rescaling_augmented_lagrangian( f, df, hf, g, dg, hg, c, dc, hc, guess, 1e-7, 0.8, 100 );
    b = calculate_b( a, y, K, C );
    
    a_all = [ a_all a ];
    b_all = [ b_all b ];
end