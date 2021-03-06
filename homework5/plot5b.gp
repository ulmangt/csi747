set nokey

set term x11 1
set xlabel "time"
set ylabel "speed"
plot "homework5b.data" using 1:8 with lines

set term x11 2
set ticslevel 0
set xlabel "x"
set ylabel "y"
set zlabel "z"
splot "homework5b.data" using 2:3:4 with lines, 0.1 * ( x**2 + y**2 ), "startEndPoint.data" using 1:2:3 with points
