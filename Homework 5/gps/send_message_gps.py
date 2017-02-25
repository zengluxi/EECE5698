import lcm
import time
import serial
import utm

from gps import gps_t

lc = lcm.LCM()
msg = gps_t()
ser = serial.Serial('/dev/ttyUSB0', 4800, timeout = 5 )

while True: 
	line = ser.readline()
	splitline = line.split(',')
	if splitline[0] == '$GPGGA':
		msg.timestamp = splitline[1]
		msg.lat = splitline[2]
		msg.lat_dir = splitline[3]
		msg.lon = splitline[4]
		msg.lon_dir = splitline[5]
		msg.alt = splitline[9]
		
		new_latitude = float(msg.lat[0:2]) + float(msg.lat[2:])/60
		new_longtitude = float(msg.lon[0:3]) + float(msg.lon[3:])/60
		UTM = utm.from_latlon(new_latitude, new_longtitude)
		
		if msg.lat_dir == 'S':
			msg.utm_x = -UTM[0]
		else:
			msg.utm_x = UTM[0]
		if msg.lon_dir == 'W':
			msg.utm_y = -UTM[1]
		else: 
			msg.utm_y = UTM[1]
	lc.publish("GPS", msg.encode())
