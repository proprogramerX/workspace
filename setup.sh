#!/bin/bash

# Add the ROS repository
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros-latest.list'

# Add the ROS key
sudo apt install -y curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Update packages
sudo apt update

# Install ROS Noetic
sudo apt install -y ros-noetic-desktop-full

# Add ROS environment variables to bashrc
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install additional dependencies
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# Initialize rosdep
sudo rosdep init
rosdep update

# Install git if not installed yet
sudo apt-get update
sudo apt install git

# git clone TARE planner from my repository
git clone https://github.com/proprogramerX/tare_planner.git

# enter into TARE planner folder
cd tare_planner

# update git submodules
git submodule update --init

# compile workspace
catkin_make

# install dependencies for MQTT ROS Node Bridge 
sudo apt install -y python3-pip
sudo apt install -y ros-noetic-rosbridge-library
sudo apt install -y mosquitto mosquitto-clients

# pip install requirements
cd src/mqtt_bridge/
pip3 install -r dev-requirements.txt

# go to workspace directory
cd ~/workspace

# install libusb-dev for AEDE
sudo apt update
sudo apt install libusb-dev

# git clone AEDE
git clone https://github.com/proprogramerX/autonomous_exploration_development_environment.git

# Enter AEDE and compile workspace
cd autonomous_exploration_development_environment
git checkout $ROS_DISTRO
catkin_make

# install sim envs
./src/vehicle_simulator/mesh/download_environments.sh

