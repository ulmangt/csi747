unset key
NX=1; NY=2;
DX=0.01; DY=0.01; SX=0.85; SY=0.25

set bmargin DX; set tmargin DX; set lmargin DY; set rmargin DY

set size SX*NX+DX*1.5,SY*NY+DY*1.8

set multiplot

set size SX,SY
set origin DX, DY;

plot "homework5a.data" using 1:2 with lines
set xlabel "time"
set ylabel "height"

set origin DX, DY+SY;
unset xtics

plot "homework5a.data" using 1:3 with lines
set xlabel "time"
set ylabel "velocity"

unset multiplot
