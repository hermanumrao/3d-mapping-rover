#!/bin/bash

source ~/ros2_ws/install/setup.bash
source ~/ws_livox/install/local_setup.bash 
source ~/fastlio/install/local_setup.bash
ros2 param set /use_sim_time true
#ros2 run tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link body

ros2 launch fast_lio mapping.launch.py config_file:=mid360.yaml & ros2 launch livox_ros_driver2 msg_MID360_launch.py & ros2 launch pointcloud_to_laserscan sample_pointcloud_to_laserscan_launch.py
