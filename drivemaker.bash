#! /bin/bash
# Simple Simple driveMaker for macOS
# licensed under CC
# Author: Henri Cattoire inspired by Gregory Conrad (https://gregoryconrad.github.io/#top)

# Variables 
VERSION="1.1"
DIR="/tmp/driveMaker"
U_VERSION="16.04.3"
D_VERSION="9.3.0"
K_VERSION="2017.3"
# Intro 
echo "Welcome to driveMaker for macOS v"$VERSION""
# Make directory where downloaded ISO files go
sudo rm -r "$DIR" > /dev/null 2>&1
sudo mkdir "$DIR"
cd "$DIR"
# Prompt for the users drive
echo "Please enter your drive's name (use the ‘diskutil list‘ command to locate your disk, ex. disk3)?"
read chosenDisk
# Make proper variable of chosenDisk
DISK="/dev/"$chosenDisk""

echo
echo "OS choice:"
echo " a: Ubuntu v"$U_VERSION""
echo " b: Debian v"$D_VERSION""
echo " c: Kali v"$K_VERSION""
echo "Please enter the letter corresponding with your choice (a, b or c):"
read userOption

echo
if [ "$userOption" == "a" ]; then
     sudo curl -L -O http://mirror.pnl.gov/releases/16.04/ubuntu-"$U_VERSION"-desktop-amd64.iso
     echo
     echo "You will need this ISO file later (use COMMAND + C to copy it):"
     echo "ubuntu-"$U_VERSION"-desktop-amd64.iso"
elif [ "$userOption" == "b" ]; then
     sudo curl -L -O https://gemmei.ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-"$D_VERSION"-amd64-netinst.iso
     echo
     echo "You will need this ISO file later (use COMMAND + C to copy it):"
     echo "debian-"$D_VERSION"-amd64-netinst.iso"
elif [ "$userOption" == "c" ]; then
     sudo curl -L -O https://cdimage.kali.org/current/kali-linux-"$K_VERSION"-amd64.iso
     echo
     echo "You will need this ISO file later (use COMMAND + C to copy it):"
     echo "kali-linux-"$K_VERSION"-amd64.iso"
     
fi
	

echo
echo "Which distribution did you downloaded (use COMMAND + V to paste it)?"
read downloadedISO
ISOFILE="$downloadedISO"
echo
echo "Unmounting your disk"
if ! diskutil unmountDisk "$DISK"
then
	echo "Oops, something went wrong, we couldn’t unmount your disk!"
	echo "Application will quit, please try again or contact me (henricattoire0@gmail.com)"
	exit 3
fi

echo
echo "About to make the bootable drive, you have 5 seconds to abort this by hitting control and C at the same time"
sleep 10

echo
echo "Making your bootable drive, this can take up to 30 minutes"
# Use these commands if you didn’t install homebrew and pv yet (make sure to comment them when using the commands below!)
sudo -v
if sudo dd if="$ISOFILE" of="$DISK" bs=4m
# Uncomment these two commands when you want to show progress (homebrew [https://brew.sh/] and pv [brew install pv] are needed) 
#sudo -v
#if sudo dd if="$ISOFILE" | pv | sudo dd of="$DISK" bs=4m
then
	echo "Drive successfully created!"
	EXITSTATUS=0
else
	echo "Drive couldn’t be created, please try again or contact me (henricattoire0@gmail.com)"
	EXITSTATUS=4
fi

# Cleaning up the application
sudo rm -r "$DIR"
echo "Quitting the application, hope to see you again soon!"  
