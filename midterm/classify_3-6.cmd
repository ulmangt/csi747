reset;
model classify_polynomial.mod;
data classify_3-6.dat;
option solver loqo;
solve;
display a > tmp.out;
