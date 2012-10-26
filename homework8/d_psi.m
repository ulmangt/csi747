function [ y ] = d_psi( t )
%PSI 1st derivative
    if t >= -0.5
        y = 1 / ( t + 1 );
    else
        y = -4*t;
    end
end