# -*- coding: utf-8 -*-
"""
Created on Sun Oct 29 23:14:46 2023

@author: Ivan.Temelkov
"""
__version__ = '$Id: kmz2dist.py 609 2023-10-29 05:04:52Z mn $'

import sys
import zipfile
import glob
from xml.dom import minidom
from zipfile import ZipFile

import distance
import math
import time


def scan(fname):
	arrName = []
	arrCoor = []
	zf = zipfile.ZipFile(fname, 'r')
	for fn in zf.namelist():
		if fn.endswith('.kml'):
			content = zf.read(fn)
			xmldoc = minidom.parseString(content)
			placemarks = xmldoc.getElementsByTagName('Placemark')
			for placemark in placemarks:
				name = placemark.getElementsByTagName('name')
				if name:
					name = name[0].firstChild.data.strip()
					coordinates = placemark.getElementsByTagName('coordinates')
					if coordinates:
						coordinates = coordinates[0].firstChild.data.strip()
						if coordinates:
							print(name)
							arrName.append(name)
							arrCoor.append(coordinates)
	print(len(arrName))
	check(arrName,arrCoor)

def check(arrName,arrCoor):
	print("check")
	double = []
	for o,x in enumerate(arrCoor):
#		print(arrName[o]) 
		for z,y in enumerate(arrCoor):
			if x==y :
#				print(arrCoor.count(x))
				continue
			newX = x.split(' ')
			startX = newX[0]
			finalX = newX[-1]
#			print(startX)
#			print(finalX)
			newY = y.split(' ')
			startY = newY[0]
			finalY = newY[-1]
#			print(startY)
#			print(finalY)
#			print(newX)
#			print(finalY)
			for i in newX:
				for j in newY:
					if i==startX:
						continue
					if i==finalX:
						continue
					if j==startY:
						continue
					if i==finalY:
						continue
					if i==j:
#						print(i)
						double.append(i)
#			print(x)
			double = list(set(double))
#wrong!			print(arrName[o]+ " - " + arrName[z])
			print(str(double))
			double.clear()
#	for d in double:
#		print(d)






def main():
	"""show .kmz file name and distance in kilometers"""
	fnames = glob.glob('C:\\Python py\\Check\*.kmz')
	if not fnames:
		print('No *.kmz files found')
	else:
		for fname in fnames:
			scan(fname)


if __name__ == '__main__':
	if '--version' in sys.argv:
		print(__version__)
	else:
		main()