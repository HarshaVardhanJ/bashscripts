#! /bin/bash
# Simple driveMaker for macOS (run with this command: sudo sh pathto/drivemaker.bash)
# licensed under CC
# Author: Henri Cattoire inspired by Gregory Conrad (https://gregoryconrad.github.io/#top)

# Variables 
VERSION="1.1"
DIR="/tmp/driveMaker"
U_VERSION="16.04.3"
D_VERSION="9.3.0"
K_VERSION="2017.3"
# Intro 
echo
echo "Welcome to driveMaker for macOS v"$VERSION""
# Make directory where downloaded ISO files go
rm -r "$DIR" > /dev/null 2>&1
mkdir "$DIR"
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
echo " d: Other (You’ll have to provide a path to the ISO file)"
echo "Please enter the letter corresponding with your choice (a, b, c or d):"
read userOption

echo
if [ "$userOption" == "a" ]; then
     curl -L -O http://mirror.pnl.gov/releases/16.04/ubuntu-"$U_VERSION"-desktop-amd64.iso
     echo
     echo "You will need this ISO file later (use COMMAND + C to copy it):"
     echo "ubuntu-"$U_VERSION"-desktop-amd64.iso"
elif [ "$userOption" == "b" ]; then
     curl -L -O https://gemmei.ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-"$D_VERSION"-amd64-netinst.iso
     echo
     echo "You will need this ISO file later (use COMMAND + C to copy it):"
     echo "debian-"$D_VERSION"-amd64-netinst.iso"
elif [ "$userOption" == "c" ]; then
     curl -L -O https://cdimage.kali.org/current/kali-linux-"$K_VERSION"-amd64.iso
     echo
     echo "You will need this ISO file later (use COMMAND + C to copy it):"
     echo "kali-linux-"$K_VERSION"-amd64.iso"
elif [ "$userOption" == "d" ]; then
     echo "Where is the ISO file located? You will have to provide the path or you can just drag and drop the file here."
     read ISOfile
     echo
     echo "You will need this ISO file later (use COMMAND + C to copy it):"
     echo "$ISOfile"       
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
sleep 5

echo "Making your bootable drive, this can take up to 60 minutes"
# Use this command if you didn’t install homebrew and pv yet (make sure to comment this command when using the command below!)
#if dd if="$ISOFILE" of="$DISK" bs=4m
# Uncomment this command when you want to show progress (homebrew [https://brew.sh/] and pv [brew install pv] are needed) 
if dd if="$ISOFILE" | pv | dd of="$DISK" bs=4m
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
