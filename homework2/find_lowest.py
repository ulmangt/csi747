import sys
import csv

f = csv.reader( open( sys.argv[1], 'r' ), delimiter=',' )

lowx = None
lowy = None

for row in f:
  try:
    x,y = row
    fx = float( x )
    fy = float( y )
  
    if ( lowy == None or fy < lowy ):
      lowy = fy
      lowx = fx
  except ValueError:
    print "Ignoring Line", row

print 'x: {0:.3f} y: {1:.3f}'.format( lowx, lowy )
