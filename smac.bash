#! /bin/bash
# Set specific MAC address (change userInterface to the wanted interface and neMac to the wanted MAC address)
# licensed under CC
# Author: Henri Cattoire


# Sniffing up the old MAC (only useful for option a and b)
OLD="$(ifconfig userInterface | grep ether | awk -F " " '{print $2}')"
# Main
sudo ifconfig userInterface ether newMac
sudo ifconfig userInterface down
sleep 2
sudo ifconfig userInterface up
OUTPUT="$(ifconfig userInterface | grep ether | awk -F " " '{print $2}')"
echo
echo "Current MAC: "$OUTPUT""
echo "Old MAC: "$OLD""