#! /bin/bash
# Set random MAC address (change userInterface to the wanted interface)
# licensed under CC
# Author: Henri Cattoire

# Sniffing up the old MAC
OLD="$(ifconfig userInterface | grep ether | awk -F " " '{print $2}')"
# Main
openssl rand -hex 1 | tr '[:lower:]' '[:upper:]' | xargs echo "obase=2;ibase=16;" | bc | cut -c1-6 | sed 's/$/00/' | xargs echo "obase=16;ibase=2;" | bc | sed "s/$/:$(openssl rand -hex 5 | sed 's/\(..\)/\1:/g; s/.$//' | tr '[:lower:]' '[:upper:]')/" | xargs sudo ifconfig "$userInterface" ether
sudo ifconfig userInterface down
sleep 2
sudo ifconfig userInterface up
OUTPUT="$(ifconfig userInterface | grep ether | awk -F " " '{print $2}')"
echo
echo "Current MAC: "$OUTPUT""
echo "Old MAC: "$OLD""
