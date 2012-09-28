set term x11 0
set xlabel "time"
set ylabel "height"
plot "homework5a.data" using 1:2 with lines

set term x11 1
set xlabel "time"
set ylabel "velocity"
plot "homework5a.data" using 1:3 with lines

set term x11 2
set xlabel "time"
set ylabel "acceleration"
plot "homework5a.data" using 1:4 with lines

set term x11 3
set xlabel "time"
set ylabel "mass"
plot "homework5a.data" using 1:5 with lines

set term x11 4
set xlabel "time"
set ylabel "thrust"
plot "homework5a.data" using 1:6 with lines

set term x11 5
set xlabel "time"
set ylabel "air resistance"
plot "homework5a.data" using 1:7 with lines
