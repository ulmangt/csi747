import csv

f = csv.reader( open( 'problem2.out', 'r' ), delimiter=',' )

lowx = None
lowy = None

for row in f:
  x,y = row
  fx = float( x )
  fy = float( y )
  
  if ( lowy == None or fy < lowy ):
    lowy = fy
    lowx = fx

print 'x: {0:.3f} y: {1:.3f}'.format( lowx, lowy )
