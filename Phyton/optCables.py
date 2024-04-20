# -*- coding: utf-8 -*-
"""
Created on Sun Oct 22 16:17:00 2023

@author: Ivan.Temelkov
"""

__version__ = '$Id: kmz2dist.py 609 2023-10-22 16:18:00Z mn $'

import sys
import time
import zipfile
import glob
import os
import codecs
from zipfile import ZipFile


def show_txt(fname, file):
	line_cnt = 0
	with open(fname) as f:
		
			while True:
				if line_cnt == 0:
					print (fname)
					file.write('<Folder>\n' + '<name>' + os.path.splitext(fname)[0] +'</name>\n')
				line = f.readline()
				if line.replace('\n', '') != "":
					coordinates = line.replace('\n', '').split('///')[2]
					nameR = line.replace('\n', '').split('///')[0]
					file.write('	<Placemark>\n')
					file.write('				<name>' + nameR +'</name>\n')
					file.write('		<styleUrl>#m_ylw-pushpin</styleUrl>\n')
					file.write('		<visibility>0</visibility>\n')
					file.write('			<LineString>\n')
					file.write('				<tessellate>1</tessellate>\n')
					file.write('						<coordinates>\n')
					file.write('							' + coordinates + '\n')
					file.write('						</coordinates>\n')
					file.write('			</LineString>\n')
					file.write('	</Placemark>\n')
				line_cnt += 1
				if not line:
					print (line_cnt-1)
					file.write('</Folder>\n')
					break


def main():
	"""show .txt file name"""
	timestr = time.strftime("%d%m%Y")
	with codecs.open(timestr + ".kml","x",encoding='UTF-8') as file:
		file.write("<?xml version='1.0' encoding='UTF-8'?>\n")
		file.write('<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">\n')
		file.write("<Document>\n")
		file.write('	<StyleMap id="m_ylw-pushpin">\n')
		file.write("		<Pair>\n")
		file.write("			<key>normal</key>")
		file.write("			<styleUrl>#s_ylw-pushpin</styleUrl>\n")
		file.write("		</Pair>\n")
		file.write("		<Pair>\n")
		file.write("			<key>highlight</key>\n")
		file.write("			<styleUrl>#s_ylw-pushpin_hl</styleUrl>\n")
		file.write("		</Pair>\n")
		file.write("	</StyleMap>\n")
		file.write('	<Style id="s_ylw-pushpin">\n')
		file.write("		<IconStyle>\n")
		file.write("			<scale>1.1</scale>\n")
		file.write("			<Icon>\n")
		file.write("				<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>\n")
		file.write("			</Icon>\n")
		file.write('			<hotSpot x="20" y="2" xunits="pixels" yunits="pixels"/>\n')
		file.write("		</IconStyle>\n")
		file.write("		<LineStyle>\n")
		file.write("			<color>ff00aaff</color>\n")
		file.write("		</LineStyle>\n")
		file.write("	</Style>\n")
		file.write('	<Style id="s_ylw-pushpin_hl">\n')
		file.write("		<IconStyle>\n")
		file.write("			<scale>1.3</scale>\n")
		file.write("			<Icon>\n")
		file.write("				<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>\n")
		file.write("			</Icon>\n")
		file.write('			<hotSpot x="20" y="2" xunits="pixels" yunits="pixels"/>\n')
		file.write("		</IconStyle>\n")
		file.write("		<LineStyle>\n")
		file.write("			<color>ff00aaff</color>\n")
		file.write("		</LineStyle>\n")
		file.write("	</Style>\n")
		fnames = glob.glob('*.txt')
		if not fnames:
			print('No *.txt files found')
		else:
			for fname in fnames:
				show_txt(fname,file)
		file.write("</Document>\n")
		file.write("</kml>\n")

if __name__ == '__main__':
	if '--version' in sys.argv:
		print(__version__)
	else:
		main()