% problem 2 part a
[x,y] = nonlinear_rescaling( @f_1, @df_1, @hf_1, @g_1, @dg_1, @hg_1, [ 0 0 ], 1e-7, 0.8, 1 )

% problem 2 part b
[x,y] = nonlinear_rescaling( @f_2, @df_2, @hf_2, @g_2, @dg_2, @hg_2, [ 0 1 ], 1e-7, 0.8, 1 )

% problem 2 part c
[x,y] = nonlinear_rescaling( @f_3, @df_3, @hf_3, @g_3, @dg_3, @hg_3, [ -1 0 0 0 ], 1e-7, 0.8, 1 )