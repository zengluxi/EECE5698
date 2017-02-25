import sys
import lcm

from imu import imu_t

if len(sys.argv) < 2:
    sys.stderr.write("usage: read-log <logfile>\n")
    sys.exit(1)

log = lcm.EventLog(sys.argv[1], "r")

for event in log:
    if event.channel == "IMU":
        msg = imu_t.decode(event.data)

        print("Message:")
    	print(" time = %s" % msg.timestamp)
    	print(" yaw = %s" % msg.yaw)
	print(" pitch = %s" % msg.pitch)	
        print(" roll = %s" % msg.roll)
        print(" mag_x = %s" % msg.mag_x)
        print(" mag_y = %s" % msg.mag_y)
        print(" mag_z = %s" % msg.mag_z)
        print(" acc_x = %s" % msg.acc_x)
        print(" acc_y = %s" % msg.acc_y)
        print(" acc_z = %s" % msg.acc_z)
        print(" gyro_x = %s" % msg.gyro_x)
        print(" gyro_y = %s" % msg.gyro_y)
        print(" gyro_z = %s" % msg.gyro_z)

