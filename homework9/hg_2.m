function [ lambda ] = hg_2( x, i )
%HG_2 hessian matrix of constraints
    if i == 1
        lambda = zeros(5);    
    elseif i == 2
        lambda = zeros(5);
    end
end
