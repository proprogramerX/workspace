First to achieve multi-vehicle exploration using TARE, the communication channel between vehicles must be set up.
For the communication channel, we have opted to use the MQTT protocol for fast and reliable data transmission.

MQTT ROS Node Bridge

The MQTT ROS Node Bridge package allows ROS topics and messages to be transferred between different ROS masters through MQTT which converts the ROS messages into MQTT messages and vice versa.
The MQTT ROS Node Bridge communicates through publishing topics onto the MQTT Broker which can be then subscribed to by devices connected to the same broker.

![Screenshot from 2023-02-07 01-44-22](https://user-images.githubusercontent.com/15362203/217045923-5f663f90-2c2e-49ff-8a28-a7169048b424.png)

This diagram illustrates the MQTT ROS Node Bridge communication channel.

After cloning the mqtt_bridge package, the la_params.yaml paramater file can be found under {TARE source path}/mqtt_bridge_config/la_params.yaml. 
The parameter file contains parameters such as the ip address of the MQTT brokers, port, ros topics to be bridged and mqtt topics which the bridge subscirbes and publishes to.

The IP addresses can be updated by changing the value of the host: key
![Screenshot from 2023-02-07 01-44-22](https://user-images.githubusercontent.com/15362203/217047894-21524e55-d124-4779-b186-b1e3026003c6.png)

