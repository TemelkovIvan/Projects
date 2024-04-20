# -*- coding: utf-8 -*-
"""
Created on Thu Apr  4 15:29:13 2024

@author: Ivan.Temelkov
"""
__version__ = '$Id: txtTOtxt.py$'

import sys
import time
import zipfile
import glob
import os
import codecs
from zipfile import ZipFile

def main():
	fnames = glob.glob('*.txt')
	if not fnames:
		print('No *.txt files found')
	else:
		for fname in fnames:
			show_txt(fname)

def show_txt(fname):
	line_cnt = 0
	with open(fname) as f:
			while True:
				if line_cnt == 0:
					print (fname)
				line = f.readline()
				if line.replace('\n', '') != "":
					name = line.replace('\n', '').split('///')[1]
					with codecs.open(name + ".txt","a", encoding="windows-1251") as file:
						file.write(line.replace('\n', '') + "\n")
						file.close()
				line_cnt += 1
				if not line:
					print (line_cnt-1)


					break

if __name__ == '__main__':
	if '--version' in sys.argv:
		print(__version__)
	else:
		main()

"""x/y/datamapid/address/HH/Status/Es/Splitters/Cluster/OLT/OLTSite/Speed/Ports"""
"Status: 5"
"OLTSite: 10"
"Speed: 11"