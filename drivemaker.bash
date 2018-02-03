#! /bin/bash
# Simple driveMaker for macOS (run with this command: sudo sh pathto/drivemaker.bash)
# licensed under CC
# Author: Henri Cattoire inspired by Gregory Conrad (https://gregoryconrad.github.io/#top)

# Variables 
DIR="/tmp/driveMaker"
D_VERSION="VERSION" # Change the version to the current version of the desired distro (ex. 2017.3 for Kali Linux)
# Make directory where downloaded ISO files go
rm -r "$DIR" > /dev/null 2>&1
mkdir "$DIR"
cd "$DIR"
# Make proper variable of your disk (please change chosenDisk to your disk, ex. disk3)
DISK="/dev/chosenDisk"
# Downloading the ISO (change downloadLink to desired link, ex. curl -L -O https://cdimage.kali.org/current/kali-linux-"D_VERSION"-amd64.iso)
curl -L -O downloadLink
ISOFILE="$(ls | grep .iso)"
# Preparing the disk
echo
echo "Erasing your disk and setting its format to MS-DOS, you have 5 second to abort this by hitting command and C"
sleep 5
diskutil eraseDisk MS-DOS "BOOT" "$DISK"
echo "Unmounting your disk"
diskutil unmountDisk "$DISK"
# Making the bootable drive
echo
echo "Making your bootable drive, this can take up to 60 minutes"
# Use this command if you didn’t install homebrew and pv yet (make sure to comment this command when using the command below!)
dd if="$ISOFILE" of="$DISK" bs=4m
# Uncomment this command when you want to show progress (homebrew [https://brew.sh/] and pv [brew install pv] are needed) 
#dd if="$ISOFILE" | pv | dd of="$DISK" bs=4m
# Cleaning up the application
rm -r "$DIR"
echo "Quitting the application, hope to see you again soon!"  
