#!/usr/bin/env python
# -*- coding: utf-8 -*-
# for NBOSI-CT sensor (seabed 125)

import serial
ser = serial.Serial('/dev/ttyUSB0', 4800, timeout = 5 )

while True: 
	line = ser.readline()
	splitline = line.split(',')
	
	if splitline[0] == '$GPGGA':
		time = splitline[1]
		latitude = splitline[2]
		latitude_direc = splitline[3]
		longtitude = splitline[4]
		longtitude_direc = splitline[5]
		altitude = splitline[9]
		altitude_unit = splitline[10]
		
		print time,latitude,latitude_direc,longtitude,longtitude_direc,altitude_unit
		break