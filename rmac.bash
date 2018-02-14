#! /bin/bash
# Set random MAC address (you can change en1 [wifi] to whatever interface you want)
# Author: Henri Cattoire

# Variables
INTERFACE="en1"
# Sniffing up the old MAC (only useful for option a and b)
OLD="$(ifconfig "$INTERFACE" | grep ether | awk -F " " '{print $2}')"
# Main
openssl rand -hex 1 | tr '[:lower:]' '[:upper:]' | xargs echo "obase=2;ibase=16;" | bc | cut -c1-6 | sed 's/$/00/' | xargs echo "obase=16;ibase=2;" | bc | sed "s/$/:$(openssl rand -hex 5 | sed 's/\(..\)/\1:/g; s/.$//' | tr '[:lower:]' '[:upper:]')/" | xargs sudo ifconfig "$INTERFACE" ether
sudo ifconfig "$INTERFACE" down
sleep 2
sudo ifconfig "$INTERFACE" up
OUTPUT="$(ifconfig "$INTERFACE" | grep ether | awk -F " " '{print $2}')"
echo
echo "Current MAC: "$OUTPUT""
echo "Old MAC: "$OLD""
