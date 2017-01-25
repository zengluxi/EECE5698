#!/usr/bin/env python

import rospy
from std_msgs.msg import String

def publisher():
    pub = rospy.Publisher('chatter', String, queue_size=5)
    rospy.init_node('publisher', anonymous=True)
    rate = rospy.Rate(5) # 5hz
	
    while not rospy.is_shutdown():
        print_str = "this is assignment 1 %s" % rospy.get_time()
        rospy.loginfo(print_str)
        pub.publish(print_str)
        rate.sleep()

if __name__ == '__main__':
    try:
        publisher()
    except rospy.ROSInterruptException:
        pass
