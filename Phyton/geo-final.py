# -*- coding: utf-8 -*-
"""
Created on Mon Mar 18 11:18:52 2024

@author: Ivan.Temelkov
"""

import glob
import time
from geopy.geocoders import Nominatim
geolocator = Nominatim(user_agent="openstreetmap.org")

line_cnt = 0

fnames = glob.glob('*.txt')
if not fnames:
    print('No *.txt files found')
else:
    for fname in fnames:
        with open(fname) as f:
            while True:
                timestr = time.strftime("%d%m%Y")
                with open(timestr + "_coordinates_of_addresses.txt","a") as file:
                    if line_cnt == 0:
                        file.write(str(fname))
                        file.write('\n')
                        print (fname)
                    line = f.readline()
                    if line.replace('\n', '') != "":
                        number = line.replace('\n', '').split("//")[0]
                        address = line.replace('\n', '').split("//")[1]
                        location = geolocator.geocode(address)
                        print(location)
                        if(location != None):
                            print((location.latitude, location.longitude))
                            file.write('\t%s\t%s\t%s\t%s\t%s' % (number, address, location, location.latitude, location.longitude))
                            file.write('\n')
                        else:
                            file.write('\t%s\t%s' % (number, address))
                            file.write('\n')
                        line_cnt += 1
                    if not line:
                        print (line_cnt)
                        break
               
# Текстовият файл трябва да бъде във формат Windows-1251 !!!!
