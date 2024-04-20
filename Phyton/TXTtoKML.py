# -*- coding: utf-8 -*-
"""
Created on Fri Sep 29 08:45:52 2023

@author: Ivan.Temelkov
"""
__version__ = '$Id: TXTtoKML.py$'

import sys
import time
import zipfile
import glob
import os
import codecs
from zipfile import ZipFile


def show_txt(fname, file, fileName):
	line_cnt = 0
	with open(fname) as f:
			while True:
				if line_cnt == 0:
					print (fname)
					file.write('<Folder>\n' + '<name>' + os.path.splitext(fname)[0] +'</name>\n')
				line = f.readline()
				if line.replace('\n', '') != "":
					fileName1 = (line.replace('\n', '').split('///')[13])
					name = line.replace('\n', '').split('///')[3]
					one = line.replace('\n', '').split('///')[2]
					two = line.replace('\n', '').split('///')[3]
					three = line.replace('\n', '').split('///')[4]
					four = line.replace('\n', '').split('///')[5]
					five = line.replace('\n', '').split('///')[6]
					six = line.replace('\n', '').split('///')[7]
					seven = line.replace('\n', '').split('///')[8]
					eight = line.replace('\n', '').split('///')[9]
					nine = line.replace('\n', '').split('///')[10]
					ten = line.replace('\n', '').split('///')[11]
					eleven = line.replace('\n', '').split('///')[12]
					lat = line.replace('\n', '').split('///')[0]
					lon = line.replace('\n', '').split('///')[1]
					file.write('<Placemark>\n')
					file.write('<name>' + name + '</name>\n') #име на точката
					file.write('<styleUrl>#pointStyleMap23</styleUrl>\n<visibility>0</visibility>\n')
					file.write('<ExtendedData>\n')
					file.write('<SchemaData schemaUrl="#S_Work_SSS">\n')
					file.write('<SimpleData name="One">'+ one +'</SimpleData>\n')
					file.write('<SimpleData name="Two">'+ two +'</SimpleData>\n')
					file.write('<SimpleData name="Three">'+ three +'</SimpleData>\n')
#					if int(four) < 1:
#						file.write('<SimpleData name="four">'+ "" +'</SimpleData>\n')
#					else:
					file.write('<SimpleData name="four">'+ four +'</SimpleData>\n')
					file.write('<SimpleData name="five">'+ five +'</SimpleData>\n')
					file.write('<SimpleData name="six">'+ six +'</SimpleData>\n')
					file.write('<SimpleData name="seven">'+ seven +'</SimpleData>\n')
					file.write('<SimpleData name="eight">'+ eight +'</SimpleData>\n')
					file.write('<SimpleData name="nine">'+ nine +'</SimpleData>\n')
					file.write('<SimpleData name="ten">'+ ten +'</SimpleData>\n')
					file.write('<SimpleData name="eleven">'+ eleven +'</SimpleData>\n')
					file.write('</SchemaData>\n')
					file.write('</ExtendedData>\n')
					file.write('<Point>\n<coordinates>')
					file.write(lon + ',' + lat + ',0')
					file.write('</coordinates>\n</Point>\n</Placemark>\n')
				line_cnt += 1
				if not line:
					print (line_cnt-1)
					file.write('</Folder>\n')
					fileName.append(fileName1)
					break
"""x/y/datamapid/address/HH/Status/Es/Splitters/Cluster/OLT/OLTSite/Speed/Ports"""

"""
				if line_cnt == 0:
					file.write(str(fname))
"""
# Файловете се записват на следния адрес: C:\Python py\txt
#След като се създаде файл е необходимо да се прехвърли от Windows-1251 в UTF-8

def main():
	"""show .txt file name"""
	timestr = time.strftime("%d%m%Y%H%M")
	fileName = []
#	row1 = 'ES'
#	row1 = 'Info: '
	row1 = 'DataMapID'
	row2 = 'Address'
	row3 = 'HH'
	row4 = 'Status'
	row5 = 'ES'
	row6 = 'Splitter/s'
	row7 = 'Cluster'
	row8 = 'OLT'
	row9 = 'OLT Site'
	row10 = 'Speed'
	row11 = 'Ports'
	with codecs.open(timestr + ".kml","x", encoding="UTF-8") as file:
		file.write("<?xml version='1.0' encoding='UTF-8'?>\n")
		file.write("<kml xmlns='http://earth.google.com/kml/2.1'>\n")
		file.write("<Document>\n")
		file.write('<Schema name="Work" id="S_Work_SSS">')
		file.write('<SimpleField type="string" name="One"><displayName>&lt;b&gt;One&lt;/b&gt;</displayName>')
		file.write("</SimpleField>")
		file.write('<SimpleField type="string" name="Two"><displayName>&lt;b&gt;Two&lt;/b&gt;</displayName>')
		file.write("</SimpleField>")
		file.write("</Schema>\n")
		file.write('<Style id="hlightPointStyle24">')
		file.write("<IconStyle>\n")
		file.write("<Icon>")
		file.write("<href>http://maps.google.com/mapfiles/kml/shapes/placemark_circle_highlight.png</href>")
		file.write("</Icon>\n")
		file.write("</IconStyle>\n")
		file.write("<LabelStyle>")
		file.write("<color>00ffffff</color>") #имената да не се виждат
		file.write("</LabelStyle>")
		file.write("<BalloonStyle>")
		file.write('<text><![CDATA[<table border="0">')
		file.write("<tr><td><b>"+ row1 + "</b></td><td>$[Work/One]</td></tr>")
		file.write("<tr><td><b>"+ row2 + "</b></td><td>$[Work/Two]</td></tr>")
		file.write("<tr><td><b>"+ row3 + "</b></td><td>$[Work/Three]</td></tr>")
		file.write("<tr><td><b>"+ row4 + "</b></td><td>$[Work/four]</td></tr>")
		file.write("<tr><td><b>"+ row5 + "</b></td><td>$[Work/five]</td></tr>")
		file.write("<tr><td><b>"+ row6 + "</b></td><td>$[Work/six]</td></tr>")
		file.write("<tr><td><b>"+ row7 + "</b></td><td>$[Work/seven]</td></tr>")
		file.write("<tr><td><b>"+ row8 + "</b></td><td>$[Work/eight]</td></tr>")
		file.write("<tr><td><b>"+ row9 + "</b></td><td>$[Work/nine]</td></tr>")
		file.write("<tr><td><b>"+ row10 + "</b></td><td>$[Work/ten]</td></tr>")
		file.write("<tr><td><b>"+ row11 + "</b></td><td>$[Work/eleven]</td></tr>")
		file.write("</table>]]></text>")
		file.write("</BalloonStyle>\n")
		file.write("</Style>\n")
		file.write('<Style id="normPointStyle22">')
		file.write("<IconStyle>")
		file.write("<Icon>")
		file.write("<href>http://maps.google.com/mapfiles/kml/shapes/placemark_circle.png</href>")
		file.write("</Icon>\n")
		file.write("</IconStyle>\n")
		file.write("<LabelStyle>")
		file.write("<color>00ffffff</color>") #имената да не се виждат
		file.write("</LabelStyle>")
		file.write("</Style>\n")
		file.write('<StyleMap id="pointStyleMap23">')
		file.write("<Pair>")
		file.write("<key>normal</key>")
		file.write("<styleUrl>#normPointStyle22</styleUrl>")
		file.write("</Pair>\n")
		file.write("<Pair>")
		file.write("<key>highlight</key>")
		file.write("<styleUrl>#hlightPointStyle24</styleUrl>")
		file.write("</Pair>\n")
		file.write("</StyleMap>\n")
		fnames = glob.glob('*.txt')
		if not fnames:
			print('No *.txt files found')
		else:
			for fname in fnames:
				show_txt(fname,file,fileName)
		file.write("</Document>\n")
		file.write("</kml>\n")
		print(fileName[0])
		file.close()
		os.rename(timestr +'.kml',fileName[0] + '.kml')

if __name__ == '__main__':
	if '--version' in sys.argv:
		print(__version__)
	else:
		main()