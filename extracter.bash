#! /bin/bash
# Simple fileExtracter for macOS
# licensed under CC
# Author: Henri Cattoire inspired by tatumc (https://www.reddit.com/user/tatumc)

# Variables 
VERSION="1.0"
# Intro 
echo
echo "Welcome to fileExtracter for macOS v"$VERSION""
# Sniffing up the active user and go to downloads folder of that user 
userName="$(id -un)"
cd /Users/"$userName"/Downloads
# Main
echo "Where is the file located? You will have to provide the path or you can just drag and drop the file here."
read userFile
echo
echo "Extracting your file, this can take up to 2 minutes" 
if [ -f $userFile ] ; then
  case $userFile in
      *.tar.bz2)   tar xjf $userFile ;;
      *.tar.gz)    tar xzf $userFile ;;
      *.bz2)       bunzip2 $userFile ;;
      *.rar)       rar x $userFile ;;
      *.gz)        gunzip $userFile ;;
      *.tar)       tar xvf $userFile ;;
      *.zip)       unzip $userFile ;;
      *.Z)         uncompress $userFile ;;
    esac
    echo "File successfully extracted (you can find it in your downloads folder)!"
    echo "Quitting the application, hope to see you again soon!"
else
   echo "fileExtracter can’t extract this file, please try again (check your path) or contact me (henricattoire0@gmail.com)"
   echo "Quitting the application, hope to see you again soon!"
fi
