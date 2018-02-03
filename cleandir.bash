#! /bin/bash
# Clean up a directory (you can change the downloads directory to whatever directory you want)
# licensed under CC
# Author: Henri Cattoire

# Sniffing up the active user
userName="$(id -un)"
# Removing all files within that directory (option 1)
rm /Users/"$userName"/Downloads/*
# Removing all files within that directory after user confirmation (option 2)
#read -p "Are you sure (Y/N)? " -n 1 -r
#if [[ $REPLY =~ ^[Yy]$ ]]
#then
#rm /Users/"$userName"/Downloads/*
#fi
