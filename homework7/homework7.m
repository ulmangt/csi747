% http://www.wolframalpha.com/input/?i=min+2*x1+-+3*x2+subject+to+x1%5E2+%2B+x2%5E2+%3D+25
[xs iterations steps] = constrained_newton( @f_1, @df_1, @hf_1, @g_1, @dg_1, [ -2.773 4.160 ] );
xs

