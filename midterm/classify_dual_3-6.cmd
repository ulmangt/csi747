reset;
model classify_dual.mod;
data classify_dual_3-6.dat;
option solver loqo;
solve;
display a;
