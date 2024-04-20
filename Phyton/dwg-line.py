# -*- coding: utf-8 -*-
"""
Created on Mon Apr 15 13:38:37 2024

@author: Ivan Temelkov
"""

import openpyxl
from pyautocad import Autocad, APoint

acad = Autocad(create_if_not_exists=True)

workbook = openpyxl.load_workbook('PointData.xlsx')
sheet = workbook.active

for row in sheet.iter_rows(min_row=2):
    point_number,x1,y1,x2,y2 = row[0].value, row[1].value, row[2].value, row[3].value, row[4].value

    point1 = APoint(x1,y1)
    point2 = APoint(x2,y2)
    
    acad.model.AddLine(point1,point2)
    
    print(f'Line with Point for Start {point_number} drawn at ({x1},{y1})')

workbook.close()