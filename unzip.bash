#! /bin/bash
# Quickly unzip a file located in the downloads directory (or any other directory)
# licensed under CC
# Author: Henri Cattoire

# Sniffing up the active user and going to the specified directory
userName="$(id -un)"
cd /Users/"$userName"/Downloads
# Main
userFile="$(mdfind -onlyin /Users/"$userName"/Downloads .zip)"
unzip $userFile
# Cleaning everything up 
rm -r *.zip > /dev/null 2>&1
rm -r __MACOSX > /dev/null 2>&1
