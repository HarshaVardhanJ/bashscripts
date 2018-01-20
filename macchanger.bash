#! /bin/bash
# Simple application to change your mac address very quickly
# Before using this script, please change the value of the PERMANENT variable to your real mac address (ifconfig)
# CC https://creativecommons.org/licenses/by/4.0/
# Variables 
VERSION="1.0"
PERMANENT="28:cf:e9:65:e4:fd"


# Main 
echo "What would you like to do?"
echo " a: show mac address (en1)"
echo " b: change mac address (not permanent)"
echo "Please enter the letter corresponding with your choice (a or b):"
read userOption

  #option a
    echo
    if [ "$userOption" == "a" ]; then
     OUTPUT="$(ifconfig en1 | grep ether | awk -F " " '{print $2}')"
     echo "Current MAC: "$OUTPUT""
     echo "Permanent MAC: "$PERMANENT""
    fi  
 
  #option b
    echo
    if [ "$userOption" == "b" ]; then
     echo "You have 5 seconds to abort this by hitting control and C at the same time"
     sleep 5
     openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en1 ether
     OUTPUT="$(ifconfig en1 | grep ether | awk -F " " '{print $2}')"
     echo
     echo "Current MAC: "$OUTPUT""
     echo "Permanent MAC: "$PERMANENT""
    fi  