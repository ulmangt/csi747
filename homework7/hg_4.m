function [ lambda ] = hg_4( x, i )
%HG_4 hessian matrix of constraints
    if i == 1
        lambda = 2 * eye(4);
    end
end