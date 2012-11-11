% problem 1
[x,y,z] = rescaling_augmented_lagrangian( @f_1, @df_1, @hf_1, @g_1, @dg_1, @hg_1, @c_1, @dc_1, @hc_1, [ 0 ; 0 ; 0 ; 0 ], 1e-7, 0.1, 100 )

% problem 2
[x,y,z] = rescaling_augmented_lagrangian( @f_2, @df_2, @hf_2, @c_2, @dc_2, @hc_2, @g_2, @dg_2, @hg_2, [ -1.5 ; -1.5 ; 2.5 ; 1 ; 1 ], 1e-7, 0.1, 100 )