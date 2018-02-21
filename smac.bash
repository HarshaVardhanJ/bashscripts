#! /bin/bash
# Set specific MAC address (you can change en1 [wifi] to whatever interface you want and specify the MAC address with a -m flag [sh smac.bash -m 00:50:56:64:d1:6a])
# Author: Henri Cattoire

# Flag
while getopts ":m:" mac; do
  case $mac in
    m)
      m=${OPTARG}
      ;;
    *)
      echo "Usage: sh smac.bash -m <mac>">&2
      exit
      ;;
  esac
done
# If statement to quit the script when the -m option isn’t specified 
if [ -z "$m" ]; then
   echo "Usage: sh smac.bash -m <mac>">&2
   exit
fi
# Variables
MAC="${m}"
INTERFACE="en1"
# Sniffing up the old MAC
OLD="$(ifconfig "$INTERFACE" | grep ether | awk -F " " '{print $2}')"
# Main
sudo ifconfig "$INTERFACE" ether "$MAC"
sudo ifconfig "$INTERFACE" down
sleep 2
sudo ifconfig "$INTERFACE" up
OUTPUT="$(ifconfig "$INTERFACE" | grep ether | awk -F " " '{print $2}')"
echo
echo "Current MAC: "$OUTPUT""
echo "Old MAC: "$OLD""
