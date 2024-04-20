# -*- coding: utf-8 -*-
"""
Created on Thu Oct 12 23:16:07 2023

@author: Ivan.Temelkov
"""

import googlemaps

from datetime import datetime

gmaps = googlemaps.Client(key='AIzaSyCpQo1DlnFuKZOLsXmHhGEuogBiQMueb0s')

now = datetime.now()

source = "42.51731915190129,27.46162061321185"
destination = "42.50334049811815,27.47070540000487"

destination = gmaps.latlng_to_address(source)
#direction_result = gmaps.directions(source, destination, mode="driving", departure_time=now)

#print(direction_result[0]['legs'][0]['distance'])
#print(direction_result[0]['legs'][0]['duration'])
print(destination)
