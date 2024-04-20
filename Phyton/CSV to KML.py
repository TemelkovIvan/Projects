# -*- coding: utf-8 -*-
"""
Created on Fri Sep 29 15:49:27 2023

@author: Ivan.Temelkov
"""

import csv
import time
#Input the file name.

data = csv.reader(open('VivacomFTTx.csv'), delimiter = ',')
#Skip the 1st header row.
#data.next()
#Open the file to be written.
timestr = time.strftime("%d%m%Y")
fname = timestr
f = open(timestr + '.kml', 'w')

#Writing the kml file.
f.write("<?xml version='1.0' encoding='UTF-8'?>\n")
f.write("<kml xmlns='http://earth.google.com/kml/2.1'>\n")
f.write("<Document>\n")
f.write("   <name>" + fname + '.kml' +"</name>\n")
for row in data:
	f.write("   <Placemark>\n")
	f.write('       <name>' + str(row[1]) + '</name>\n')
	f.write("       <description>" + str(row[0]) + "</description>\n")
	f.write("       <Point>\n")
	f.write("           <coordinates>" + str(row[3]) + "," + str(row[2]) + "," + str(row[4]) + "</coordinates>\n")
	f.write("       </Point>\n")
	f.write("   </Placemark>\n")
f.write("</Document>\n")
f.write("</kml>\n")
print ('File Created')
f.close()