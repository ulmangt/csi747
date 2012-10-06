model;

# number of training examples
param l;

# number of input parameters (number of pixels in the handwriting digit images)
param n;

# weight on xi penalty coefficient in primal problem
param C;

# output vector (1 or -1)
param y { 1..l };

# input data
param x { 1..l, 1..n };

# hyperplane parameters
var w { 1..n };
var b;

# relaxation allowing for non-separable problems
var xi { 1..l };

minimize obj: 0.5 * ( sum { i in 1..n } w[i]^2 ) + C * ( sum { i in 1..l } xi[i] ) ;

s.t. nonneg { i in 1..l }: xi[i] >= 0;

s.t. hplane { i in 1..l }: y[i] * ( ( sum { k in 1..n } x[i,k] * w[k] ) - b ) >= 1 - xi[i] ;

option solver loqo;
