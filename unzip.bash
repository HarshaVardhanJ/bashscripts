#! /bin/bash
# Quickly unzip a file located in the downloads folder (or any other folder)
# licensed under CC
# Author: Henri Cattoire

# Variables 
DIR="1.0"
# Sniffing up the active user
userName="$(id -un)"
cd /Users/"$userName"/Downloads
# Main
userFile="$(mdfind -onlyin /Users/"$userName"/Downloads .zip)"
unzip $userFile
# Cleaning everything up 
rm -r *.zip > /dev/null 2>&1
rm -r __MACOSX > /dev/null 2>&1