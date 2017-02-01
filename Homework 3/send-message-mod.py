import lcm
import time
import serial
import utm

from exlcm import message_t

lc = lcm.LCM()
msg = message_t()
ser = serial.Serial('/dev/ttyUSB0', 4800, timeout = 5 )

while True: 
	line = ser.readline()
	splitline = line.split(',')
	if splitline[0] == '$GPGGA':
		msg.time = splitline[1]
		msg.latitude = splitline[2]
		msg.latitude_direc = splitline[3]
		msg.longtitude = splitline[4]
		msg.longtitude_direc = splitline[5]
		msg.altitude = splitline[9]
		msg.altitude_unit = splitline[10]
		
		new_latitude = float(msg.latitude[0:2]) + float(msg.latitude[2:])/60
		new_longtitude = float(msg.longtitude[0:3]) + float(msg.longtitude[3:])/60

		UTM = utm.from_latlon(new_latitude, new_longtitude)
		msg.utm_x = UTM[0]
		msg.utm_y = UTM[1]
		
	lc.publish("message", msg.encode())
