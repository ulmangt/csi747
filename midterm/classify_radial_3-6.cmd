reset;
model classify_radial.mod;
data classify_3-6.dat;
option solver loqo;
solve;
display a > tmp.out;
