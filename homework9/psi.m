function [ y ] = psi( t )
%PSI
    if t >= -0.5
        y = log( t + 1 );
    else
        y = -2*t^2 - 0.19314718;
    end
end