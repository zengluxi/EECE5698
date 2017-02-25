import lcm

from gps import gps_t

def my_handler(channel, data):
    msg = gps_t.decode(data)
    print(" Received message on channel \"%s\"" % channel)
    print(" latitude = %s" % str(msg.lat))
    print(" latitude direction = %s" % msg.lat_dir)
    print(" longtitude = %s" % str(msg.lon))
    print(" longtitude direction = %s" % msg.lon_dir)
    print(" altitude = %s" % str(msg.alt))
    print(" utm_x = %s" % str(msg.utm_x))
    print(" utm_y = %s" % str(msg.utm_y))

lc = lcm.LCM()
subscription = lc.subscribe("GPS", my_handler)

try:
    while True:
        lc.handle()
except KeyboardInterrupt:
    pass

lc.unsubscribe(subscription)
