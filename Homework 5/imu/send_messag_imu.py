import lcm
import time
import serial

from imu import imu_t

lc = lcm.LCM()
msg = imu_t()
ser = serial.Serial('/dev/ttyUSB0', 115200, timeout = 5 )

while True: 
	line = ser.readline()
	splitline = line.split(',')
	if splitline[0] == '$VNYMR':
		
		msg.yaw = splitline[1]
		msg.pitch = splitline[2]
		msg.roll = splitline[3]
		msg.mag_x = splitline[4]
		msg.mag_y = splitline[5]
		msg.mag_z = splitline[6]
		msg.acc_x = splitline[7]
		msg.acc_y = splitline[8]
		msg.acc_z = splitline[9]
		msg.gyro_x = splitline[10]
		msg.gyro_y = splitline[11]
		msg.gyro_z = splitline[12]
		
	lc.publish("IMU", msg.encode())
