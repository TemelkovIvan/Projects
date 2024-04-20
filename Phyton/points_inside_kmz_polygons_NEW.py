# -*- coding: utf-8 -*-
"""
Created on Mon Mar 14 10:56:48 2022

@author: Ivan Temelkov
"""

#!/usr/bin/env python
# coding: utf-8


import sys
import os
import csv
import math
import codecs

from io import StringIO
from xml.dom.minidom import parseString
from zipfile import ZipFile
#from polygon import *
from shapely.geometry import Point, Polygon

path = "C:\\out\\"

def openKMZ(filename):
    zip=ZipFile(filename)
    for z in zip.filelist:
        if z.filename[-4:] == '.kml':
            fstring=zip.read(z)
            break
    else:
        raise Exception("Could not find kml file in %s" % filename)
    return fstring

def openKML(filename):
    try:
        fstring=openKMZ(filename)
    except Exception:
        fstring=open(filename,'r').read()
    return parseString(fstring)

def readPoly(filename):
    def parseData(d):
        dlines=d.split()
        poly=[]
        for l in dlines:
            l=l.strip()
            if l:
                point=[]
                for x in l.split(','):
                    point.append(float(x))
                poly.append(point[:2])
        return poly

    xml=openKML(filename)
    nodes=xml.getElementsByTagName('Placemark')
    
    for n in nodes:
        names=n.getElementsByTagName('name')
        name = "?"
        try:
            name=names[0].childNodes[0].data.strip()
        except Exception:
            pass
        
        polys=n.getElementsByTagName('Polygon')
        for poly in polys:
            invalid=False
            c=n.getElementsByTagName('coordinates')
            if len(c) > 23:
                print ('invalid polygon found for ' + name + " " + str(len(c)))
                continue
            if not invalid:
                c=c[0]
                d=c.childNodes[0].data.strip()
                polygon=Polygon(parseData(d))
                yield (name, polygon)
                
csv_files=[]
kmz_files=[]

for x in os.listdir(path):
    if not x.startswith("new_"):
        if x.endswith("Coordinates.csv"):
            csv_files.append(x)
        if x.endswith(".kmz"):
            kmz_files.append(x)

polygons = []
for kmzfile in kmz_files:
    for name,poly in readPoly(path+kmzfile):
        polygons.append([name,poly])

for csvfile in csv_files:
    
    with codecs.open(path+csvfile, 'r', encoding='utf-8') as csv_file:
        with codecs.open(path+"new_"+csvfile, 'w', encoding='cp1251') as out_file:            
            csv_reader = csv.reader(csv_file, delimiter=',')
            csv_writer = csv.writer(out_file, delimiter=';', quotechar='"')
            line_count = 0
            more_clusters = 0
            out_of_cluster = 0
            count_polygons = 0
            points = 0

            for row in csv_reader:
                if line_count == 0:
                    row.append("Y")
                    row.append("Coordinates")
                    row.append("Polygon")
                    csv_writer.writerow(row)
                else:
                    name = "Out of polygons"
                    try:
                        points += 1
                        x = float(row[-1])
                        y = float(row[-2])
                        p = Point(x,y)
                        for np in polygons:
                            count_polygons += 1
                            if p.within(np[1]):
                                if name == "Out of polygons":
                                    name=np[0]
                                else:
                                    name = name+"; "+np[0]
                                    more_clusters += 1
                    except Exception:
                        name = "Invalid coordinates"
                        pass
                    row.append(str(y)+","+str(x))
                    if name == "Out of polygons":
                        out_of_cluster +=1
                    row.append(name)
                    csv_writer.writerow(row)
                line_count += 1       
            print("Брой полигони: " + str(count_polygons))
            print("Брой точки: " + str(points))
            print("Брой точки намерени в полигони: " + str(points-out_of_cluster))
            print("Брой точки не намерени в полигони: " + str(out_of_cluster))
            print("Брой точки намерени в повече полигони: " + str(more_clusters))
