

__version__ = '$Id: kmz_distance_with_folder.py$'


import sys
import zipfile
import glob
from xml.dom import minidom
from zipfile import ZipFile

import distance
import math
import time


def get_distance(coordinates_str):
	sum_distance = 0.0
	arr = []
	coordinates = []
	if ' ' in coordinates_str:
		arr = coordinates_str.split(' ')
	if len(arr) > 1:
		for s in arr:
			if ',' in s:
				pt = s.split(',')
				pos_latt = (float(pt[0].strip()), 0, 0)
				pos_long = (float(pt[1].strip()), 0, 0)
				position = (pos_latt, pos_long)
				coordinates.append(position)
	if coordinates:
		for i in range(len(coordinates) - 1):
			start = coordinates[i]
			stop = coordinates[i + 1]
			sum_distance += points2distance(start, stop)
	return sum_distance


def show_distance(fname):
	"""calculates distance from points saved in doc.kml which is part of .kmz
	   zip archive file"""
	path_cnt = 0
	zf = zipfile.ZipFile(fname, 'r')
	for fn in zf.namelist():
		if fn.endswith('.kml'):
			content = zf.read(fn)
			xmldoc = minidom.parseString(content)
			folders = xmldoc.getElementsByTagName('Folder')
			for folder in folders:
				folderName = folder.getElementsByTagName('name')
				folderName = folderName[0].firstChild.data.strip()
				folders2 = folder.getElementsByTagName('Folder')
				for folder2 in folders2:
						folder2Name = folder2.getElementsByTagName('name')
						if folder2Name:
							folder2Name = folder2Name[0].firstChild.data.strip()
							if " - " in folder2Name:
								placemarks = folder2.getElementsByTagName('Placemark')
								for placemark in placemarks:
										name = placemark.getElementsByTagName('name')
										if name:
											name = name[0].firstChild.data.strip()
											coordinates = placemark.getElementsByTagName('coordinates')
											if coordinates:
												coordinates = coordinates[0].firstChild.data.strip()
												if coordinates:
													distance_km = get_distance(coordinates)
													if distance_km > 0.0:
															if path_cnt == 0:
																print (fname)
																timestr = time.strftime("%d%m%Y")
															print('\t%s\t%s\t%5.2f' % (folder2Name, name, distance_km))
															with open(timestr + "_distance_for_each_route_in_KMZ.txt","a") as file:
																	if path_cnt == 0:
																		file.write('\n')
																		file.write(str(fname))
																	file.write('\n')
																	file.write('\t%s\t%s\t%5.2f' % (folder2Name, name, distance_km))      #str input
																	path_cnt += 1

	return path_cnt

def points2distance(start,end):
  start_long = math.radians(recalculate_coordinate(start[0],  'deg'))
  start_latt = math.radians(recalculate_coordinate(start[1],  'deg'))
  end_long = math.radians(recalculate_coordinate(end[0],  'deg'))
  end_latt = math.radians(recalculate_coordinate(end[1],  'deg'))
     
  d_latt = end_latt - start_latt
  d_long = end_long - start_long
 
  a = math.sin(d_latt/2)**2 + math.cos(start_latt) * math.cos(end_latt) * math.sin(d_long/2)**2
  c = 2 * math.atan2(math.sqrt(a),  math.sqrt(1-a))

  return 6371 * c

def recalculate_coordinate(val,  _as=None):
  """
    Accepts a coordinate as a tuple (degree, minutes, seconds)
    You can give only one of them (e.g. only minutes as a floating point number) 
    and it will be duly recalculated into degrees, minutes and seconds.
    Return value can be specified as 'deg', 'min' or 'sec'; default return value is 
    a proper coordinate tuple.
  """
  deg,  min,  sec = val
  # pass outstanding values from right to left
  min = (min or 0) + int(sec) / 60
  sec = sec % 60
  deg = (deg or 0) + int(min) / 60
  min = min % 60
  # pass decimal part from left to right
  dfrac,  dint = math.modf(deg)
  min = min + dfrac * 60
  deg = dint
  mfrac,  mint = math.modf(min)
  sec = sec + mfrac * 60
  min = mint
  if _as:
    sec = sec + min * 60 + deg * 3600
    if _as == 'sec': return sec
    if _as == 'min': return sec / 60
    if _as == 'deg': return sec / 3600
  return deg,  min,  sec

def main():
	"""show .kmz file name and distance in kilometers"""
	fnames = glob.glob('C:\\Python py\\kmz\*.kmz')
	if not fnames:
		print('No *.kmz files found')
	else:
		for fname in fnames:
			show_distance(fname)


if __name__ == '__main__':
	if '--version' in sys.argv:
		print(__version__)
	else:
		main()