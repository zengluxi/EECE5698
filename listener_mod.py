import lcm

from exlcm import message_t

def my_handler(channel, data):
    msg = message_t.decode(data)
    print("   Received message on channel \"%s\"" % channel)
    print("   time=%s" % str(msg.time))
    print("   latitude= %s" % str(msg.latitude))
    print("   latitude direction=%s" % str(msg.latitude_direc))
    print("   longtitude= %s" % str(msg.longtitude))
    print("   longtitude_direction=%s" % str(msg.longtitude_direc))
    print("   altitude=%s" % str(msg.altitude))
    print("   altitude_unit='%s" % str(msg.altitude_unit))
    print("   utm_x='%s" % str(msg.utm_x))	
    print("   utm_y='%s" % str(msg.utm_y))

lc = lcm.LCM()
subscription = lc.subscribe("message", my_handler)

try:
    while True:
        lc.handle()
except KeyboardInterrupt:
    pass

lc.unsubscribe(subscription)
