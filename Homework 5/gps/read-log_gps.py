import sys
import lcm

from gps import gps_t

if len(sys.argv) < 2:
    sys.stderr.write("usage: read-log <logfile>\n")
    sys.exit(1)

log = lcm.EventLog(sys.argv[1], "r")

for event in log:
    if event.channel == "GPS":
        msg = gps_t.decode(event.data)

        print("Message:")
    	print(" time   = %s" % msg.timestamp)
    	print(" latitude    = %s" % msg.lat)
    	print(" longtitude = %s" % msg.lon)
    	print(" altitude =  %s" % msg.alt)
	print(" utm_x  = %s" % msg.utm_x)  
	print(" utm_y  = %s" % msg.utm_y)
