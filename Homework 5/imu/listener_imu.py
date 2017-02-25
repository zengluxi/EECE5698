import lcm

from imu import imu_t

def my_handler(channel, data):
    msg = imu_t.decode(data)
    print(" Received message on channel \"%s\"" % channel)
    print(" yaw = %s" % str(msg.yaw))
    print(" pitch = %s" % str(msg.pitch))
    print(" roll = %s" % str(msg.roll))
    print(" magx = %s" % str(msg.mag_x))
    print(" magy = %s" % str(msg.mag_y))
    print(" magz = %s" % str(msg.mag_z))
    print(" gyrox = %s" % str(gyro_x))
    print(" gyroy = %s" % str(gyro_y))
    print(" gyroz = %s" % str(gyro_z))

lc = lcm.LCM()
subscription = lc.subscribe("IMU", my_handler)

try:
    while True:
        lc.handle()
except KeyboardInterrupt:
    pass

lc.unsubscribe(subscription)
