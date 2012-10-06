reset;
model classify_primal.mod;
data classify_primal_3-6.dat;
option solver loqo;
solve;
display w;
display xi;
display b;
