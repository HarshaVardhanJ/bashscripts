#! /bin/bash
# Simple application to change your MAC address quickly
# licensed under CC
# Author: Henri Cattoire

# Variables 
VERSION="1.0"
# Intro 
echo "Welcome to macchanger for macOS v"$VERSION""
echo "Which interface are you using (ex. en1,...)?"
read userInterface
# Sniffing up the permanent MAC
PERMANENT="$(ifconfig "$userInterface" | grep ether | awk -F " " '{print $2}')"
# Main 
echo
echo "What do you want to do?"
echo " a: Show MAC address"
echo " b: Set the MAC XX:XX:XX:XX:XX:XX "
echo " c: Set random MAC"
echo "Please enter the letter corresponding with your choice (a, b or c):"
read userOption

echo
if [ "$userOption" == "a" ]; then
    OUTPUT="$(ifconfig "$userInterface" | grep ether | awk -F " " '{print $2}')"
    echo
    echo "Current MAC: "$OUTPUT""
elif [ "$userOption" == "b" ]; then
    echo "To which MAC do you want to change?"
    read newMac
    echo "You have 5 seconds to abort this by hitting control and C at the same time"
    sleep 5
    sudo ifconfig "$userInterface" ether "$newMac"
    sudo ifconfig "$userInterface" down
    sleep 1
    sudo ifconfig "$userInterface" up
    OUTPUT="$(ifconfig "$userInterface" | grep ether | awk -F " " '{print $2}')"
    echo
    echo "Current MAC: "$OUTPUT""
    echo "Permanent MAC: "$PERMANENT""
     
elif [ "$userOption" == "c" ]; then
     echo "You have 5 seconds to abort this by hitting control and C at the same time"
     sleep 5
     openssl rand -hex 1 | tr '[:lower:]' '[:upper:]' | xargs echo "obase=2;ibase=16;" | bc | cut -c1-6 | sed 's/$/00/' | xargs echo "obase=16;ibase=2;" | bc | sed "s/$/:$(openssl rand -hex 5 | sed 's/\(..\)/\1:/g; s/.$//' | tr '[:lower:]' '[:upper:]')/" | xargs sudo ifconfig "$userInterface" ether
     sudo ifconfig "$userInterface" down
     sleep 1
     sudo ifconfig "$userInterface" up
     OUTPUT="$(ifconfig "$userInterface" | grep ether | awk -F " " '{print $2}')"
     echo
     echo "Current MAC: "$OUTPUT""
     echo "Permanent MAC: "$PERMANENT""
fi    