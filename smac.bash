#! /bin/bash
# Set specific MAC address (you change en1 [wifi] to whatever interface you want and neMac to the wanted MAC address)
# licensed under CC
# Author: Henri Cattoire

# Sniffing up the old MAC
OLD="$(ifconfig en1 | grep ether | awk -F " " '{print $2}')"
# Main
sudo ifconfig en1 ether newMac
sudo ifconfig en1 down
sleep 2
sudo ifconfig en1 up
OUTPUT="$(ifconfig en1 | grep ether | awk -F " " '{print $2}')"
echo
echo "Current MAC: "$OUTPUT""
echo "Old MAC: "$OLD""
