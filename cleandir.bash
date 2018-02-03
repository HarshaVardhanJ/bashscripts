#! /bin/bash
# Clean up a directory (you can change the downloads directory to whatever directory you want)
# licensed under CC
# Author: Henri Cattoire

# Sniffing up the active user
userName="$(id -un)"
# (1) Removing all files within that directory (uncomment this line of code when using option 2)
rm /Users/"$userName"/Downloads/*
# (2) You can also uncomment the following block of code if you want user confimation
#read -p "Are you sure (Y/N)? " -n 1 -r
#if [[ $REPLY =~ ^[Yy]$ ]]
#then
#rm /Users/"$userName"/Downloads/*
#fi