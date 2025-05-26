#!/bin/bash

source ~/ws_livox/install/local_setup.bash 
source ~/fastlio/install/local_setup.bash
ros2 service call /map_save std_srvs/srv/Trigger {}

