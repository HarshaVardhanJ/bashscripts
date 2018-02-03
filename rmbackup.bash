#! /bin/bash
# Automatically delete all TimeMachine backups older than a week (default)
# Author: Henri Cattoire

# Variables
BACKUPD="TMdisk"
# Main 
OLDBACKUPS="$(find /Volumes/"$BACKUPD"/Backups.backupdb/* -mtime +7)"
echo "Removing all files, this can take a long time"
rm -r $OLDBACKUPS