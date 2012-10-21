function [ y ] = hf_3( x )
%HF_3 hessian matrix of function to minimize
    y = [ 18*x(1), 0, 0, 0 ;
          0, 12*x(2), 0, 0 ;
          0, 0,  6*x(3), 0 ;
          0, 0, 0, 6*x(4) ];
end