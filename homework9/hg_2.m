function [ lambda ] = hg_2( x, i )
%HG_2 hessian matrix of constraints
    if i == 1
        lambda = [ [ -2  0  0  0  0 ]
                   [  0 -2  0  0  0 ]
                   [  0  0 -2  0  0 ]
                   [  0  0  0 -2  0 ]
                   [  0  0  0  0  0 ] ];
    elseif i == 2
        lambda = zeros(5);
        lambda(1,1) = -2;
    elseif i == 3
        lambda = zeros(5);
    end
end