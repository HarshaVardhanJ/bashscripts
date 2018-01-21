#! /bin/bash
# Simple diskutility application from terminal
# licensed under CC
# Author: Henri Cattoire

# Variables
VERSION="1.0"
# Intro
echo "Welcome to diskModifier for macOS v"$VERSION""
# Get the name of the disk the user wants to modify
echo "Which disk do you want to modify (use the ‘diskutil list‘ command to locate your disk, ex. disk3)?"
read chosenDisk
# Make proper variable of chosenDisk
DISK="/dev/"$chosenDisk""
# Main
echo
echo "What do you want to do?"
echo " a: Rename the disk"
echo " b: Partition the disk"
echo " c: Erase the disk"
echo " d: Mount/unmount the disk"
echo " e: Eject the disk"
echo "Please enter the letter corresponding with your choice (a, b, c, d or e):"
read userOption

echo
if [ "$userOption" == "a" ]; then
     echo "What is the current name of your disk?"
     read oldNameDisk
     echo "Which new name should the disk have?"
     read newNameDisk
     diskutil rename ""$oldNameDisk"" ""$newNameDisk""
     echo "Disk successfully renamed, enjoy!"
    
elif [ "$userOption" == "b" ]; then
     echo "How many partitions should your disk have (max. 4)?"
     read numberOfPartitions
     echo "What partitioning scheme do you want to use (APM, MBR [default] or GPT)? "
     read partitionScheme
     echo "Give the format, name and size (%, G, M, tb) for each partition in that order (everything separated by a space)."
     read partition1F partition1N partition1S partition2F partition2N partition2S partition3F partition3N partition3S partition4F partition4N partition4S
     echo "You have 3 seconds to abort this by hitting control and C at the same time"
     sleep 3
     diskutil partitionDisk "$DISK" "$numberOfPartitions" "$partitionScheme" "$partition1F" "$partition1N" "$partition1S" "$partition2F" "$partition2N" "$partition2S" "$partition3F" "$partition3N" "$partition3S" "$partition4F" "$partition4N" "$partition4S"
     echo "Disk successfully partitioned, enjoy!"
     
elif [ "$userOption" == "c" ]; then
     echo "Which format should the disk have (JHFS+, JHFSX, MS-DOS, etc)?"
     read formatDisk
     echo "Which name should the disk have?"
     read nameAfterFormat
     echo "You have 3 seconds to abort this by hitting control and C at the same time"
     sleep 3
     diskutil eraseDisk "$formatDisk" ""$nameAfterFormat"" "$DISK"
     echo "Disk successfully formatted, enjoy!"
     
elif [ "$userOption" == "d" ]; then
     echo "Do you want to mount or unmount the disk (no capital letters)?"
     read choiceOfUser
     diskutil "$choiceOfUser"Disk "$DISK"
     echo "Disk successfully "$choiceOfUser"ed!"
     
elif [ "$userOption" == "e" ]; then
     diskutil eject "$DISK"
     echo "Disk successfully ejected!"
fi    