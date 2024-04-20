# -*- coding: utf-8 -*-
"""
Created on Tue Mar  5 11:39:23 2024

@author: Ivan.Temelkov
"""

import openpyxl
from pyautocad import Autocad, APoint

acad = Autocad(create_if_not_exists=True)

workbook = openpyxl.load_workbook('PointData.xlsx')
sheet = workbook.active

for row in sheet.iter_rows(min_row=2):
    point_number,x,y,text = row[0].value, row[1].value, row[2].value, row[3].value
    
    point = APoint(x,y)
#    acad.model.AddPoint(point)
    acad.model.AddText(text, point, 11)
    
    print(f'Point {point_number} drawn at ({x},{y})')
    
workbook.close()