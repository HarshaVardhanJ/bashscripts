#!/bin/bash
# Simple script to crack md5 hashes using a dictionary attack (useful website for dictionary lists: https://wiki.skullsecurity.org/Passwords)
# Author: Henri Cattoire
# TO BE CHANGED: /pathto.txt

# Flag
while getopts ":h:" hash; do
  case $hash in
    h)
      h=${OPTARG}
      ;;
    *)
      echo "Usage: sh crackmyhash.bash -h <hash>">&2
      exit
      ;;
  esac
done
# If statement to quit the script when the -h option isn’t specified 
if [ -z "$h" ]; then
   echo "Usage: sh crackmyhash.bash -h <hash>"
   exit
fi
# Variables
HASH="${h}"
GREEN=$'\e[1;32m'
EXIT=$'\e[0m'
SECONDS=0 # Start script timer
# Main
while read word; do 
  NHASH="$(md5 -q -s $word 2>.NULCMH )"
  rm -rf .NULCMH > /dev/null 2>&1 # Remove the NUL file that was hiding any mistakes in the list
  if [ "$NHASH" == "$HASH" ]; then
     DURATION=$SECONDS # Ends script timer
     echo "${GREEN}HASH CRACKED${EXIT} (time elapsed: $(($DURATION / 60))m $(($DURATION % 60))s)"
     echo ""$HASH" -> "$word""
     exit
  fi
done < /pathto.txt # Provide the path to your dictionary list here
