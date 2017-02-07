import rospy
from std_msgs.msg import String

def param_talker():
    # Initialize the node 
    rospy.init_node('param_talker')
    
    # fetech a global parameter 
    global_example = rospy.get_param("/global_example")
    rospy.loginfo("%s is %s", rospy.resolve_name('/global_example'), global_example)

    # fetch a group (dictionary) of parameters
    gains = rospy.get_param('gains')
    p, i, d = gains['P'], gains['I'], gains['D']
    rospy.loginfo("gains are %s, %s, %s", p, i, d) 

    # set some parameters
    rospy.loginfo('setting parameters...')
    rospy.set_param('list_of_floats', [1., 2., 3., 4.])
    rospy.set_param('bool_True', True)
    rospy.loginfo('...parameters have been set')
        
if __name__ == '__main__':
    try:
        param_talker()
    except rospy.ROSInterruptException: pass

