#! /bin/bash
# Quickly unzip a file located in the downloads directory (or any other directory)
# Author: Henri Cattoire

# Sniffing up the active user and going to the specified directory
userName="$(id -un)"
cd /Users/"$userName"/Downloads
# Main
find ./ -name \*.zip -exec unzip {} \;
# Cleaning everything up 
rm -r *.zip > /dev/null 2>&1
rm -r __MACOSX > /dev/null 2>&1