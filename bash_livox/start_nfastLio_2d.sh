#!/bin/bash

# Source all environments
source ~/ros2_ws/install/setup.bash
source ~/ws_livox/install/local_setup.bash 
source ~/fastlio/install/local_setup.bash

# Launch Livox driver in the background
ros2 launch livox_ros_driver2 msg_MID360_launch.py &
LIVOX_PID=$!
sleep 2  # Wait for livox to start

# Launch FastLIO in the background
ros2 launch fast_lio mapping.launch.py config_file:=mid360.yaml &
FASTLIO_PID=$!
sleep 2  # Wait for FastLIO to start

# Publish static transform
ros2 run tf2_ros static_transform_publisher 0 0 0 0 0 0 cloud camera_init &
ros2 run tf2_ros static_transform_publisher 0 0 0 0 0 0 body base_link &
TF_PID=$!

# Launch pointcloud_to_laserscan (in foreground)
ros2 launch pointcloud_to_laserscan sample_pointcloud_to_laserscan_launch.py&

#finally occupancy grid
ros2 launch occupancy_grid_mapper occupancy_grid_mapper_launch.py