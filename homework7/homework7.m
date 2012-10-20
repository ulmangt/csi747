% http://www.wolframalpha.com/input/?i=min+2*x1+-+3*x2+subject+to+x1%5E2+%2B+x2%5E2+%3D+25
% solution: ( - 10 / sqrt( 13 ) , 15 / sqrt( 13 ) = ( -2.7735, 4.16025 )
[xs iterations steps] = constrained_newton( @f_1, @df_1, @hf_1, @g_1, @dg_1, [ -2.7735 4.16025 ] );
xs

% http://www.wolframalpha.com/input/?i=minimize+x1%5E2%2B2*x1*x2%2Bx2%5E2+subject+to+3*x1%5E2%2Bx2%5E2%3D9
% solution: ( -3/2, 3/2 ) and ( 3/2, -3/2 )
[xs iterations steps] = constrained_newton( @f_2, @df_2, @hf_2, @g_2, @dg_2, [ -1.51, 1.51 ] );
xs
