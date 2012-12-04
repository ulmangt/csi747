function [ y ] = dd_psi( t )
%PSI 2st derivative
    if t >= -0.5
        y = -1 / ( t + 1 )^2;
    else
        y = -4;
    end
end