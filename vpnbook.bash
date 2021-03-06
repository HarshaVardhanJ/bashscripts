#! /bin/bash
# Simple bash script to start up openvpn and run it with vpnbook (you can install openvpn using homebrew [brew install openvpn])
# Author: Henri Cattoire inspired by Rob Seder (https://gist.github.com/RobSeder)
# TO BE CHANGED: username (to find out yours, just use this command: id -un)

# Variables
VPN="vpnbook-fr1-tcp80.ovpn" # Change the value of the variable to the desired VPN from https://www.vpnbook.com/freevpn
GREEN=$'\e[1;32m'
EXIT=$'\e[0m'
# Moving to directory where our VPN’s are stored  (make this directory before using the script with this command: mkdir /Users/username/.openvpn-script )
DIR="/Users/username/.openvpn-script"
cd "$DIR"
rm -rf freevpn  > /dev/null 2>&1 # Makes sure that there will not be duplicates
curl -O https://www.vpnbook.com/freevpn  > /dev/null 2>&1
# Making a proper variable of the username and password
UN="$(cat freevpn | grep -m 1 "Username:" | sed "s@<li>Username: <strong>@@g" | sed "s@</strong></li>@@g" | tr -d "\t" | tr -d " ")"
PWD="$(cat freevpn | grep -m 1 "Password:" | sed "s@<li>Password: <strong>@@g" | sed "s@</strong></li>@@g" | tr -d "\t" | tr -d " ")"
# Main
echo "Current username: ${GREEN}$UN${EXIT}"
echo "Current password: ${GREEN}$PWD${EXIT}"
echo
echo "${GREEN}You chose to connect to "$VPN" ...${EXIT}"
openvpn /Users/username/.openvpn-script/"$VPN" # Be sure to move all your VPNbook files to the /Users/username/.openvpn-script directory using the mv command
# Cleaning up the script
rm -rf freevpn  > /dev/null 2>&1
