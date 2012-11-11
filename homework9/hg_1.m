function [ lambda ] = hg_1( x, i )
%HG_1 hessian matrix of constraints
    if i == 1
        lambda = -2 * eye(4);    
    elseif i == 2
        lambda = zeros(4);
    end
end