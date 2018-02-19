#! /bin/bash
# Makes and saves .nse scripts (or .lua libraries) in the right directory
# Author: Henri Cattoire

while getopts ":n:" opt; do 
  case $opt in
    n)
      # Variables
      SCRIPT="$OPTARG" # or LIB="$OPTARG" for libraries
      # Going to the right directory
      cd /usr/local/share/nmap/scripts # or cd /usr/local/share/nmap/nselib for libraries
      # Main
      curl https://svn.nmap.org/nmap/scripts/"$SCRIPT" >> "$SCRIPT" # or curl https://svn.nmap.org/nmap/nselib/"$LIB" >> "$LIB" for libraries
      CHECK="$(find "$SCRIPT")"
      echo "FOLLOWING FILE WAS ADDED: "$SCRIPT"" # or echo "FOLLOWING FILE WAS ADDED: "$LIB""
      exit 1
      ;;
   esac
done