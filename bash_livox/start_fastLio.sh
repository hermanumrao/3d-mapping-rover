#!/bin/bash


source ~/ws_livox/install/local_setup.bash 
source ~/fastlio/install/local_setup.bash

ros2 launch fast_lio mapping.launch.py config_file:=mid360.yaml & ros2 launch livox_ros_driver2 msg_MID360_launch.py
