function [ lambda ] = hg_3( x, i )
%HG_3 hessian matrix of constraints
    if i == 1
        lambda = -2 * eye(4);    
    elseif i == 2
        lambda = zeros(4);
    end
end