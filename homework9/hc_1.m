function [ lambda ] = hc_1( x, i )
%HC_1 hessian matrix of constraints
    if i == 1
        lambda = -2 * eye(4);    
    elseif i == 2
        lambda = zeros(4);
    end
end

